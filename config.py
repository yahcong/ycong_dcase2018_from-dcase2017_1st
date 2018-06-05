# workspace = ""
workspace = "/c/Users/丛亚欢/ycong_dcase_2018_task4_baseline"

# config
sample_rate = 16000.
n_window = 1024
n_overlap = 360      # ensure 240 frames in 10 seconds
max_len = 240        # sequence max length is 10 s, 240 frames. 
step_time_in_sec = float(n_window - n_overlap) / sample_rate

# Id of classes
ids = ['Speech', 'Dog', 'Cat', 'Alarm_bell_ringing', 'Dishes', 
       'Frying', 'Blender', 'Running_water', 'Vacuum_cleaner','Electric_shaver_toothbrush']

# Name of classes
lbs = ['Speech', 'Dog', 'Cat', 'Alarm_bell_ringing', 'Dishes', 
       'Frying', 'Blender', 'Running_water', 'Vacuum_cleaner', 'Electric_shaver_toothbrush']

idx_to_id = {index: id for index, id in enumerate(ids)}
id_to_idx = {id: index for index, id in enumerate(ids)}
idx_to_lb = {index: lb for index, lb in enumerate(lbs)}
lb_to_idx = {lb: index for index, lb in enumerate(lbs)}
num_classes = len(lbs)   
