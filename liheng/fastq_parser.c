FASTA/FASTQ Parser in C

 Home
FASTQ Format
The FASTQ format is documented in several places, including Wikipedia, the MAQ website and UCR. These pages differ slightly from each other, but they largely describe the same format.

FASTQ format is frequently confused with another similar yet different format, the Illumina read sequence format, which has similar layout but a different scale in the quality string.


FASTQ/FASTQ Parser in C
The C header file kseq.h is a small library for parsing the FASTA/FASTQ format. It is compatiable with all the FASTQ variants to date. As this parser does not interpret quality strings, it also works with the Illumina read sequence format. Important features include:

Parse both FASTA and FASTQ format, and even a mixture of FASTA and FASTQ records in one file.
Seamlessly adapt to gzipped compressed file when used with zlib.
Support multi-line FASTQ.
Work on a stream with an internal stream buffer.
This parser is based on a generic stream buffer, which complicates the API a bit but makes the parser works with various types of files and even C strings. For ordinary file I/O, you can use KSEQ_INIT(gzFile, gzread) to set the type of file handler and the read() function. Function kseq_init() is used to initialize the parser and kseq_destroy() to destroy it. Function kseq_read() reads one sequence and fills the kseq_t struct which is:
view plainprint?
typedef struct {  
    size_t l, m;  
    char *s;  
} kstring_t;  
  
typedef struct {  
    kstring_t name, comment, seq, qual;  
    int last_char;  
    kstream_t *f;  
} kseq_t;  
where kseq_t::name, kseq_t::comment, kseq_t::seq and kseq_t::qual give the sequence name, comment, sequence and quality, respectively. Other fields are for internal use only. The following shows an example. This file can also be acquired from the complete tar-ball.

view plainprint?
#include <zlib.h>  
#include <stdio.h>  
#include "kseq.h"  
// STEP 1: declare the type of file handler and the read() function  
KSEQ_INIT(gzFile, gzread)  
  
int main(int argc, char *argv[])  
{  
    gzFile fp;  
    kseq_t *seq;  
    int l;  
    if (argc == 1) {  
        fprintf(stderr, "Usage: %s <in.seq>\n", argv[0]);  
        return 1;  
    }  
    fp = gzopen(argv[1], "r"); // STEP 2: open the file handler  
    seq = kseq_init(fp); // STEP 3: initialize seq  
    while ((l = kseq_read(seq)) >= 0) { // STEP 4: read sequence  
        printf("name: %s\n", seq->name.s);  
        if (seq->comment.l) printf("comment: %s\n", seq->comment.s);  
        printf("seq: %s\n", seq->seq.s);  
        if (seq->qual.l) printf("qual: %s\n", seq->qual.s);  
    }  
    printf("return value: %d\n", l);  
    kseq_destroy(seq); // STEP 5: destroy seq  
    gzclose(fp); // STEP 6: close the file handler  
    return 0;  
}  
Last modified: 2009-05-15
