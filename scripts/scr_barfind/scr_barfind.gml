function scr_barfind(bar_times, target_time) {
    if (array_length(bar_times) == 0) return -1; // 空数组处理
    
    var nearest_bar = bar_times[0][0];
    var min_distance = abs(nearest_bar - target_time);
    
    for (var i = 1; i < array_length(bar_times); i++) {
        var distance = abs(bar_times[i][0] - target_time);
        if (distance < min_distance) {
            min_distance = distance;
            nearest_bar = bar_times[i][0];
        }
    }
    
    return nearest_bar;
}