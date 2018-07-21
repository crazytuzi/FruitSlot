package
{

	import laya.display.Stage;
	import laya.events.Event;
	import laya.utils.Handler;
	import laya.webgl.WebGL;

	import ui.GameUI;

	public class Main
	{
		/**游戏页面***/
		private var game : Game;

		public function Main ()
		{

			Laya.init ( 720 , 1280 , WebGL );
			//全屏不等比缩放模式
			//Laya.stage.scaleMode = Stage.SCALE_EXACTFIT;
			//加载游戏页面资源
			Laya.loader.load ( "res/atlas/gameUI.atlas" , Handler.create ( this , this.gameStart ));

		}

		private function gameStart () : void
		{

			//实例化游戏页面
			game = new Game ();
			Laya.stage.addChild ( game );



		}
	}
}
