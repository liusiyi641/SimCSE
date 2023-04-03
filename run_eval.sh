#!/bin/bash

python evaluation.py \
  --model_name_or_path model_path_here\
  --pooler cls \
  --mode test \
  --task_set na\
  --tasks STSBenchmark

