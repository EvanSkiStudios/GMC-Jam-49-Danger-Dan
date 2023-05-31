draw_self();

var c_random = irandom_range(c_aqua, c_silver);
laser_color = c_random;


gpu_set_blendmode(bm_subtract);
draw_line_width_color(
x_offset, y_offset,
target_x, target_y, 
1, c_gray, c_gray);
gpu_set_blendmode(bm_add);
draw_line_width_color(
x_offset, y_offset,
target_x, target_y,
1, laser_color, laser_color);
gpu_set_blendmode(bm_normal);