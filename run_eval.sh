#!/bin/bash

python evaluation.py \
  --model_name_or_path result/simcse-unsup-glm-large-chinese-bert-base-chinese-bestCSTB \
  --pooler cls \
  --mode test \
  --task_set na\
  --tasks STSBenchmark \
  --init_embeddings_model glm_local

