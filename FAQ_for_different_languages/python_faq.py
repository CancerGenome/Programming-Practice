#!/usr/bin/python
# from this link http://nbviewer.jupyter.org/urls/umich.box.com/shared/static/gkg1m0zhk7m6eniaf2emcikbvteppxi6.ipynb
# created 01/27/2016, by Yu Wang (yulywang@umich.edu)

Array/List:
    squares = [1,4,9]
    squares[-1] returen 9
    squares[:] return all list
    squares + [1,2,3] = [2,6,12]
    letters = ['a','b','c']
    letters[1:2] return a and b 
    len(letters) return length of letter

Multiple Dimension List:
    a = ['a','b','c']
    n = [1,2,3]
    x = [a,n ]
    [['a', 'b', 'c'], [1, 2, 3]]
    x[0][1] return 'b'

String/Tuples: 
    t=12345, 23456,'hello'!
    t[0] return 12345. 
    tt = t,(1,2,3,4,5) return ((12345, 54321, 'hello!'), (1, 2, 3, 4, 5))

    singleton = 'hello',   #<--- pay attention of comma
    len(singleton) return 1, not 5
    split: x,y,z = t; will return x as 12345, y as 23456 , and z as hello

Hash/Dictionary: 
    x = {"a": 25, "b": -1, "c": 0 }
    print {x["b"]}
    del x['b'] # remove hash key b 
    x['d'] = 29
    list(x.keys())  return keys of x 
    sorted(x.keys()) return string sort of x keys
    'f' in x return FALSE
    'a' in x return TRUE
    dict directly: 
        dict([('a',12),('b',20),('c',30)])
        dict(a=12,b=20,c=30) # prefer this methods
        get {'a':12,'b':20,'c':30}
    arbitary key and value like {x: X**2 for x in (2,4,6)} return{2:4, 4:16, 6:36}

Set: like a vector or list, but with {}
        basket = {'apple','banana','pear'}
        orange in basket return FALSE
        pear in basket return TRUE
        a = set('aba')
        b = set('ade')
        set(a) return unique of letter in a {'a','b'}
        a-b return {'b'}# in a not in b
        a | b : either a or b
        a & b : both a and b
        a ^ b : a or b, but not both
        a={x for x in 'abracadabra' if x not in 'abc'} return {'r','d'}

Numpy: import numpy as np # import library numpy as
       x = np.asarray([5,1,4,7,3,0], dtype=np.float64) # should be homogeneous, have same type
       print(x.dtpe) return np.float64
       bool = np.assary([FALSE,TRUE])
       print(x[bool]) will return 1 , which is second vector for X

       create zero multiple dimension matrix: x = np.zeros((4,3,3))

Pandas: manipulate heterogenous dataset in different columns
        import pandas as pd
        y = pd.Series([5, 13, 7], index=["b", "e", "f"])
        x = pd.Series([5,5, 13, 7], index=["a","b", "e", "f"])

    Adding:
        print(x+y) 
        OR x.add(y) return
        b     10
        e     26
        f     14
        a     NaN
        dtype: int64
        x.add(y,fill_value=0) get
        b     10
        e     26
        f     14
        a     5  # add 0 if absent in b
        dtype: int64

    Slicing:
        print(x.iloc[1:2]) will return 
        b     5 # note end of coordinate is not reported
        dtype: int64
        print(x.loc["b":"d"]) will return
        b     5
        c     13
        d     7
        dtype: int64

    Targeting:
        print x.loc["row1","b"] will return 5  # kind of similar with data frame
        OR x.iloc[0,1] will return 5
        OR x.loc["row1",:].iloc[1] will return 5 

Reference: 
        x = np.array([[1, 4], [3,2], [5,6]])
        y = x[1, :]
        y[1]=88 # will change x result 
        No Refernce: y=x[1,:].copy()
Merge:
    df1 = pd.DataFrame(np.random.normal(size=(4, 2)), index=[1, 3, 4, 5], columns=("A", "B"))
    df2 = pd.DataFrame(np.random.normal(size=(5, 3)), index=[1, 2, 5, 6, 7], columns=("C", "D", "E"))
    df3 = pd.merge(pd1,pd2,left_index=TRUE, right_index=TRUE) # will report both df1 and df2 with index
    df3 = pd.merge(pd1,pd2,left_index=TRUE, right_index=TRUE,how="outer") # will report either df1 or df2 with index
    df3 = pd.merge(df1, df2, left_index=True, right_index=True, how='left') # only left were kept
    df3 = pd.merge(df1, df2, left_on="A", right_on="C")  # unclear
