#!/bin/bash 

# You need to modify to your dataset path
#TEST_WAV_DIR="C:\\Users\\丛亚欢\\ycong_dcase_2018_task4_baseline\\test"
#TRAIN_WAV_DIR="C:\\Users\\丛亚欢\\ycong_dcase_2018_task4_baseline\\melo"
#EVALUATION_WAV_DIR="/vol/vssp/datasets/audio/audioset/task4_dcase2017_audio/official_downloads/evaluation"


# You can to modify to your own workspace. 
WORKSPACE=`pwd`
TEST_WAV_DIR=$WORKSPACE"/test"
TRAIN_WAV_DIR=$WORKSPACE"/melo"
echo $TEST_WAV_DIR
# Extract features
#python prepare_data.py extract_features --wav_dir=$TEST_WAV_DIR --out_dir=$WORKSPACE"/features/logmel/testing" --recompute=True
#python prepare_data.py extract_features --wav_dir=$TRAIN_WAV_DIR --out_dir=$WORKSPACE"/features/logmel/training" --recompute=True
#python prepare_data.py extract_features --wav_dir=$EVALUATION_WAV_DIR --out_dir=$WORKSPACE"/features/logmel/evaluation" --recompute=True

# Pack features
#python prepare_data.py pack_features --fe_dir=$WORKSPACE"/features/logmel/testing" --csv_path="meta_data/test.csv" --out_path=$WORKSPACE"/packed_features/logmel/testing.h5"
#python prepare_data.py pack_features --fe_dir=$WORKSPACE"/features/logmel/training" --csv_path="meta_data/weak.csv" --out_path=$WORKSPACE"/packed_features/logmel/training.h5"
#python prepare_data.py pack_features --fe_dir=$WORKSPACE"/features/logmel/evaluation" --csv_path="" --out_path=$WORKSPACE"/packed_features/logmel/evaluation.h5"

# Calculate scaler
#python prepare_data.py calculate_scaler --hdf5_path=$WORKSPACE"/packed_features/logmel/training.h5" --out_path=$WORKSPACE"/scalers/logmel/training.scaler"

# Train SED
#THEANO_FLAGS=mode=FAST_RUN,device=cpu,floatX=float32 python main_crnn_sed.py train --tr_hdf5_path=$WORKSPACE"/packed_features/logmel/training.h5" --te_hdf5_path=$WORKSPACE"/packed_features/logmel/testing.h5" --scaler_path=$WORKSPACE"/scalers/logmel/training.scaler" --out_model_dir=$WORKSPACE"/models/crnn_sed"

# Recognize SED
#THEANO_FLAGS=mode=FAST_RUN,device=cpu,floatX=float32 python main_crnn_sed.py recognize --te_hdf5_path=$WORKSPACE"/packed_features/logmel/testing.h5" --scaler_path=$WORKSPACE"/scalers/logmel/training.scaler" --model_dir=$WORKSPACE"/models/crnn_sed" --out_dir=$WORKSPACE"/preds/crnn_sed"

# Get stat of SED
THEANO_FLAGS=mode=FAST_RUN,device=cpu,floatX=float32 python main_crnn_sed.py get_stat --pred_dir=$WORKSPACE"/preds/crnn_sed" --stat_dir=$WORKSPACE"/stats/crnn_sed" --submission_dir=$WORKSPACE"/submissions/crnn_sed"
