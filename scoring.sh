#!/bin/bash

#baseline
#hyper hypo  gloss
#bt ru gloss
#bt de gloss
#bt de context
#syn replacement context
#mlm context
#bt de gloss+context

#file="sent_cls_ws_baseline"
#file="sent_cls_ws_hyper_hypo"
#file="sent_cls_ws_base_bbase_ru"
#file="de_best"
#file="context_aug"
#file="sent_cls_ws_base_cwbase"
#file="sent_cls_ws_base_bbase_cbbase"

#  echo $file
for file in "sent_cls_ws_hyper_concatenate_sep"
  for e in {1..6}
  do
    results_folder="./results/$file/1314/$e"

#    export CUDA_VISIBLE_DEVICES=0,1,2,3

#    python ./run_classifier_WSD_sent.py \
#    --task_name WSD \
#    --eval_data_dir ./Evaluation_Datasets/ALL/ALL_n_final.tsv \
#    --output_dir $results_folder \
#    --bert_model $results_folder \
#    --do_test \
#    --do_eval \
#    --do_lower_case \
#    --eval_batch_size 128 \
#    --learning_rate 2e-5 \
#    --seed 1314

    python ./convert_result_token_sent.py \
      --dataset ALL \
      --input_file $results_folder/results.txt \
      --output_dir $results_folder

  if [ -f "$results_folder/final_result_ALL.txt" ]
  then
    echo $file/1314/$e
    java Scorer ./Evaluation_Datasets/ALL/ALL_n.gold.key.txt $results_folder/final_result_ALL.txt
  fi
  done
done

