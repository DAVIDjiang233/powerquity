function scr_barline(bpm_array, start_time, end_time){
    var bar_lines = [];
    
    // 遍历所有BPM段
    for (var i = 0; i < array_length(bpm_array); i++) {
        var segment_start = bpm_array[i][0];
        var bpm = bpm_array[i][1];
        var _cut=#AAAAAA;
        var _text="";
        // 确定当前BPM段的结束时间
        var segment_end = (i < array_length(bpm_array) - 1) ? bpm_array[i + 1][0] : end_time;
        
        // 只处理与目标时间范围有交集的BPM段
        if (segment_end >= start_time && segment_start <= end_time) {
            // 计算小节间隔(毫秒) - 假设4/4拍，一小节=4拍
            var bar_interval = 60000 / (bpm*global.barline);
            var onebar = 60000 / bpm ;
            // 找到当前段内第一个小节线的时间
            var first_bar_time = ceil((max(segment_start, start_time) - segment_start) / bar_interval) * bar_interval + segment_start;
            
            // 生成当前段内的小节线
            var bar_time = first_bar_time;
            while (bar_time < min(segment_end, end_time)) {
                if (bar_time >= start_time) {
                    
                    if round((((bar_time-segment_start))/onebar)*global.barline)%global.barline==0  _cut=#FC3636;
                    else if round((((bar_time-segment_start))/onebar)*global.barline*2)%global.barline==0  _cut=#0093FD;
                    else if round((((bar_time-segment_start))/onebar)*global.barline*3)%global.barline==0  _cut=#B36CFF;
                    else if round((((bar_time-segment_start))/onebar)*global.barline*4)%global.barline==0  _cut=#F2C94C;
                    else if round((((bar_time-segment_start))/onebar)*global.barline*6)%global.barline==0  _cut=#F758A4;
                    else if round((((bar_time-segment_start))/onebar)*global.barline*8)%global.barline==0  _cut=#F27437;
                    else if round((((bar_time-segment_start))/onebar)*global.barline*12)%global.barline==0  _cut=#33FAFF;
                    else if round((((bar_time-segment_start))/onebar)*global.barline*16)%global.barline==0  _cut=#30D987;
                    else _cut=#CCCCCC;
                    if _cut==#FC3636
                    _text=string(round(((bar_time-segment_start))/onebar));
                    //else _text="";
                    else if round((((bar_time-segment_start))/onebar)*global.barline)%2 _text=0;
                    else _text="."+string(round((((bar_time-segment_start))/onebar)*global.barline)%global.barline);
                
                    
                    array_push(bar_lines, [round(bar_time),_cut,_text]);
                }
                bar_time += bar_interval;
            }
        }
    }
    
    return bar_lines;
}