#!/bin/bash

NUM_GPU=4

# Randomly set a port number
# If you encounter "address already used" error, just run again or manually set an available port id.
PORT_ID=$(expr $RANDOM + 1000)

# Allow multiple threads
export OMP_NUM_THREADS=4

#python train.py \
python -m torch.distributed.launch --nproc_per_node $NUM_GPU --master_port $PORT_ID train.py \
    --model_name_or_path bert-base-chinese \
    --train_file data/all_news_and_summaries.txt \
    --output_dir result/simcse-unsup-glm-large-chinese-bert-base-chinese-bestCSTB-testrun \
    --num_train_epochs 1 \
    --per_device_train_batch_size 64 \
    --learning_rate 3e-5 \
    --max_seq_length 32 \
    --evaluation_strategy steps \
    --metric_for_best_model stsb_spearman \
    --load_best_model_at_end \
    --save_steps 1000 \
    --eval_steps 1000 \
    --pooler_type cls \
    --mlp_only_train \
    --overwrite_output_dir \
    --temp 0.05 \
    --do_train \
    --do_eval \
    --fp16 \
    --cache_dir /shared/siyiliu/cache_models \
    --init_embeddings_model glm_local