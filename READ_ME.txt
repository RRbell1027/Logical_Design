每個資料夾都有一個testbench跟若干個file。

我只是粗略地把功能寫出來了，格式要求沒有完全做到，請另外調整。

用vivado的話：
	1.創造一個新project。
	2.在Source Window中，點選Add Source按鈕，或者按 Alt + A。
	3.把testbench放入simulation source裡面，其餘的放入design source裡。
	4.接著在Flow Navigator Window中，點選Simulation選單裡的Run Simulation，在跑出來的選單中點選Run Behavioral Simulation。
	5.之後就應該要跑出wave圖才對，如果沒有，就自己在Tcl console中找原因吧。
	6.先把座標移到t=0，然後zoom full，圖太小在zoom in。

用ModelSim的話：
	1.創造一個新project。
	2.在Project Window中按右鍵點選Add To Project -> Exiting File...。
	3.把同一題的所有file一起加進去，之後檔案應該就會出現在Project Window裡面了。
	4.程式碼稍作修改：
		ModelSim 和 Vivado 不知道事編譯器還是SDK的問題，Verilog的語法稍稍不一樣。
		原本在Vivado中：
		    /--------------------------------------------------\ 
		    |	module mymodule(input a, input b, output m);   |
		    |		wire a,b,m;                            |
                    \--------------------------------------------------/
		要改成：
		    /--------------------------------------------------\
		    |	module mymodule(a,b,m);                        |
		    |		input a,b;                             |
		    |		output m;                              |
		    |		wire a,b,m;                            |
                    \--------------------------------------------------/
		不然ModelSim的Debug系統會誤以為你重複定義了a,b,m。
	5.存檔，然後在Project Window右鍵 -> Compile -> Compile All。
	6.在Library Window中，打開work資料夾，右鍵testbench,選擇Simulation。
	7.應該會出現Object, Process, Wave Window。
	8.把Odject裡面所有物件挪到Wave，按下上方工具列的Run all功能。
	9.在波形圖中右鍵Zoom Full，應該就會有想要的圖了。

在步驟中迷路了請先自行上網查一查，或上moodle找之前助教的ppt。
