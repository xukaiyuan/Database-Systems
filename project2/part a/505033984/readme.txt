{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf830
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 In line 335 of \'93cleantext.py\'94, there is a flag of decompressing or not, and the default is False. If someone wants to test the decompressing of bz2 file, he or she can set the flag to be True.\
\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 Some clarification about the difference between our outputs and sample outputs:\
1. We do not think words on two sides of '/' should be considered as one whole part, they may have completely no relations.\
2. We do not think words between "" and '' should be considered as one whole part, especially when content between them is very long.\
3. We skip the special character like some smiley face (seems they make no sense in text analysis).\
4. Typos are treated as are input intentionally, that is, typos like 'text(s' will be parsed to 'text s'.\
5. We have not found a way to treat Chinese punctuations, so they are filtered in most cases.\
6. There are sometimes one extra space in the end of some parsed texts (does not influence the following processing).\
7. Cases like \'93on\'85..power\'94 in sample-output.txt are confusing and we parsed it into \'93on power\'94 since we think that taking it into a whole doesn\'92t make sense.\
\
\
If any unexpected error happens, please email to kyxu@g.ucla.edu. Thanks a lot!}