
@@ -0,0 +1,29 @@
# Copyright (c) 2022 PaddlePaddle Authors. All Rights Reserved.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export CUDA_VISIBLE_DEVICES=7

log_dir=log_prune
rm -rf $log_dir

python ./tools/train.py \
    -c ./ppfleetx/configs/nlp/gpt/prune_gpt_345M_single_card.yaml \
    -o Engine.max_steps=100000 \
    -o Model.hidden_dropout_prob=0.0 \
    -o Model.attention_probs_dropout_prob=0.0 \
    -o Optimizer.lr.decay_steps=72000 \
    -o Optimizer.weight_decay=0.0 \
    -o Optimizer.lr.max_lr=2.5e-5 \
    -o Optimizer.lr.min_lr=5.0e-6 \
    -o Compress.pretrained='./PaddleFleetX_GPT_345M_220826'
