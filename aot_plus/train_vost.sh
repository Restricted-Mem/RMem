exp="aotplus"
# exp="debug"
gpu_num="1"
devices="4"

# model="aott"
# model="aots"
# model="aotb"
# model="aotl"
model="r50_aotl"
# model="swinb_aotl"
	
stage="pre_vost"
CUDA_VISIBLE_DEVICES=${devices} python tools/train.py --amp \
	--exp_name ${exp} \
	--stage ${stage} \
	--model ${model} \
	--gpu_num ${gpu_num} \
	--batch_size 2 \
	# --log ./debug_logs

dataset="vost"
split="val"
CUDA_VISIBLE_DEVICES=${devices} python tools/eval.py --exp_name ${exp} --stage ${stage} --model ${model} \
	--dataset ${dataset} --split ${split} --gpu_num ${gpu_num} --ms 1.0