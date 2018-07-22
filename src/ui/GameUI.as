/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 

	public class GameUI extends View {
		public var btn_go:Button;
		public var btn_8:Button;
		public var fruit_8_t:Image;
		public var fruit_8_o:Image;
		public var btn_7:Button;
		public var fruit_7_t:Image;
		public var fruit_7_o:Image;
		public var btn_6:Button;
		public var fruit_6_t:Image;
		public var fruit_6_o:Image;
		public var btn_5:Button;
		public var fruit_5_t:Image;
		public var fruit_5_o:Image;
		public var point:Box;
		public var point_panel:Image;
		public var point_thousand:Image;
		public var point_hundred:Image;
		public var point_ten:Image;
		public var point_one:Image;
		public var btn_4:Button;
		public var fruit_4_t:Image;
		public var fruit_4_o:Image;
		public var btn_3:Button;
		public var fruit_3_t:Image;
		public var fruit_3_o:Image;
		public var btn_2:Button;
		public var fruit_2_t:Image;
		public var fruit_2_o:Image;
		public var btn_1:Button;
		public var fruit_1_t:Image;
		public var fruit_1_o:Image;
		public var pos_0:Image;
		public var pos_1:Image;
		public var pos_2:Image;
		public var pos_3:Image;
		public var pos_4:Image;
		public var pos_5:Image;
		public var pos_6:Image;
		public var pos_7:Image;
		public var pos_8:Image;
		public var pos_9:Image;
		public var pos_10:Image;
		public var pos_11:Image;
		public var pos_12:Image;
		public var pos_13:Image;
		public var pos_14:Image;
		public var pos_15:Image;
		public var pos_16:Image;
		public var pos_17:Image;
		public var pos_18:Image;
		public var pos_19:Image;
		public var pos_20:Image;
		public var pos_21:Image;
		public var pos_22:Image;
		public var pos_23:Image;
		public var btn_coin:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"y":0,"x":0,"width":720,"height":1280},"child":[{"type":"Image","props":{"y":195,"x":119,"skin":"gameUI/slotmachine.png"}},{"type":"Button","props":{"y":718,"x":484,"width":95,"var":"btn_go","stateNum":2,"skin":"gameUI/go.png","height":49}},{"type":"Box","props":{"y":775,"x":124},"child":[{"type":"Button","props":{"y":28,"width":68,"var":"btn_8","stateNum":2,"skin":"gameUI/b8.png","height":77}},{"type":"Image","props":{"x":27,"width":15,"var":"fruit_8_t","skin":"gameUI/num0.png","height":24}},{"type":"Image","props":{"x":47,"width":15,"var":"fruit_8_o","skin":"gameUI/num0.png","height":24}}]},{"type":"Box","props":{"y":776,"x":178},"child":[{"type":"Button","props":{"y":27,"width":66,"var":"btn_7","stateNum":2,"skin":"gameUI/b7.png","name":"fruit_7","height":77}},{"type":"Image","props":{"x":28,"width":15,"var":"fruit_7_t","skin":"gameUI/num0.png","height":24}},{"type":"Image","props":{"x":47,"width":15,"var":"fruit_7_o","skin":"gameUI/num0.png","height":24}}]},{"type":"Box","props":{"y":776,"x":234},"child":[{"type":"Button","props":{"y":28,"width":60,"var":"btn_6","stateNum":2,"skin":"gameUI/b6.png","name":"fruit_6","height":76}},{"type":"Image","props":{"x":22,"width":15,"var":"fruit_6_t","skin":"gameUI/num0.png","height":24}},{"type":"Image","props":{"y":1,"x":43,"width":15,"var":"fruit_6_o","skin":"gameUI/num0.png","height":24}}]},{"type":"Box","props":{"y":776,"x":292},"child":[{"type":"Button","props":{"y":28,"x":2,"width":55,"var":"btn_5","stateNum":2,"skin":"gameUI/b5.png","name":"fruit_5","height":75}},{"type":"Image","props":{"y":1,"x":18,"width":15,"var":"fruit_5_t","skin":"gameUI/num0.png","height":24}},{"type":"Image","props":{"x":37,"width":15,"var":"fruit_5_o","skin":"gameUI/num0.png","height":24}}]},{"type":"Box","props":{"y":425,"x":276,"var":"point"},"child":[{"type":"Image","props":{"width":190,"var":"point_panel","skin":"gameUI/slotmachine-1.png","height":103}},{"type":"Box","props":{"y":26,"x":18},"child":[{"type":"Image","props":{"var":"point_thousand","skin":"gameUI/points0.png"}},{"type":"Image","props":{"x":38,"var":"point_hundred","skin":"gameUI/points0.png"}},{"type":"Image","props":{"x":78,"var":"point_ten","skin":"gameUI/points0.png"}},{"type":"Image","props":{"x":118,"width":39,"var":"point_one","skin":"gameUI/points0.png","height":58}}]}]},{"type":"Box","props":{"y":776,"x":359},"child":[{"type":"Button","props":{"y":29,"width":55,"var":"btn_4","stateNum":2,"skin":"gameUI/b4.png","name":"fruit_4","height":76}},{"type":"Image","props":{"y":1,"x":13,"width":15,"var":"fruit_4_t","skin":"gameUI/num0.png","height":24}},{"type":"Image","props":{"x":34,"width":15,"var":"fruit_4_o","skin":"gameUI/num0.png","height":24}}]},{"type":"Box","props":{"y":777,"x":415},"child":[{"type":"Button","props":{"y":28,"width":60,"var":"btn_3","stateNum":2,"skin":"gameUI/b3.png","name":"fruit_3","height":76}},{"type":"Image","props":{"x":12,"width":15,"var":"fruit_3_t","skin":"gameUI/num0.png","height":24}},{"type":"Image","props":{"x":30,"width":15,"var":"fruit_3_o","skin":"gameUI/num0.png","height":24}}]},{"type":"Box","props":{"y":776,"x":469},"child":[{"type":"Button","props":{"y":29,"width":64,"var":"btn_2","stateNum":2,"skin":"gameUI/b2.png","name":"fruit_2","height":77}},{"type":"Image","props":{"x":8,"width":15,"var":"fruit_2_t","skin":"gameUI/num0.png","height":24}},{"type":"Image","props":{"y":1,"x":27,"width":15,"var":"fruit_2_o","skin":"gameUI/num0.png","height":24}}]},{"type":"Box","props":{"y":777,"x":524},"child":[{"type":"Button","props":{"y":28,"width":68,"var":"btn_1","stateNum":2,"skin":"gameUI/b1.png","name":"fruit_1","height":75}},{"type":"Image","props":{"x":6,"width":15,"var":"fruit_1_t","skin":"gameUI/num0.png","height":24}},{"type":"Image","props":{"x":26,"width":15,"var":"fruit_1_o","skin":"gameUI/num0.png","height":24}}]},{"type":"Box","props":{"y":201,"x":152},"child":[{"type":"Image","props":{"y":172,"x":345,"width":68,"var":"pos_0","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"y":115,"x":345,"width":68,"var":"pos_1","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"y":57,"x":345,"width":68,"var":"pos_2","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"x":345,"width":68,"var":"pos_3","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"x":287,"width":68,"var":"pos_4","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"x":233,"width":68,"var":"pos_5","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"x":176,"width":68,"var":"pos_6","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"x":116,"width":68,"var":"pos_7","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"x":60,"width":68,"var":"pos_8","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"width":68,"var":"pos_9","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"y":57,"width":68,"var":"pos_10","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"y":115,"width":68,"var":"pos_11","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"y":172,"width":68,"var":"pos_12","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"y":229,"width":68,"var":"pos_13","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"y":285,"x":0,"width":68,"var":"pos_14","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"y":343,"x":0,"width":68,"var":"pos_15","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"y":343,"x":60,"width":68,"var":"pos_16","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"y":343,"x":116,"width":68,"var":"pos_17","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"y":343,"x":176,"width":68,"var":"pos_18","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"y":343,"x":233,"width":68,"var":"pos_19","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"y":343,"x":287,"width":68,"var":"pos_20","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"y":343,"x":345,"width":68,"var":"pos_21","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"y":285,"x":345,"width":68,"var":"pos_22","skin":"gameUI/purpleBox.png","height":68}},{"type":"Image","props":{"y":229,"x":345,"width":68,"var":"pos_23","skin":"gameUI/purpleBox.png","height":68}}]},{"type":"Button","props":{"y":723,"x":365,"width":93,"var":"btn_coin","stateNum":2,"skin":"gameUI/slotmachine-1.png","height":36}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}