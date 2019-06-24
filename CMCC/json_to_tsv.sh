#!/bin/bash
cat>tsv_to_tsv<<EOF
# -*- coding:utf-8 -*-
#!/bin/python3
import sys
import json

def process_res(res_text):
    text = ''
    o = json.loads(res_text)
    for fragment in o:
        sentences = fragment['Sentences']
        if sentences:
            text += ''.join(sentences)
    return text

for line in sys.stdin:
    line = line.rstrip('\r\n')
    f = line.split('\t')
    corpus_name = f[0]
    filename = f[1]
    filepath = f[2]
    speaker_id = f[3]
    session_id = f[4]
    gender = f[5]
    transcription = f[6]

    res_file = '/samples_out/_samples_wav_{}.wav.round1.res'.format(filename)
    with open(res_file) as fd:
        res_hyp = process_res(fd.read())
        res_hyp = res_hyp.replace('，', '')
        res_hyp = res_hyp.replace('。', '')
        res_hyp = res_hyp.replace('？', '')
    print('{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}'.format(corpus_name, filename, filepath, speaker_id, session_id, gender, transcription, res_hyp))
EOF