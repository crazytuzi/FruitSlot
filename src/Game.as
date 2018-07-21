package
{

	import laya.events.Event;
	import laya.ui.Button;

	import ui.GameUI;

	public class Game extends GameUI
	{
		/**当前游戏状态***/
		private var state : Boolean = false;

		/**当前是增加还是减少***/
		private var addOrdel : Boolean = false;

		/**每种水果初始值***/
		private var fruit_1 : int = 0;

		private var fruit_2 : int = 0;

		private var fruit_3 : int = 0;

		private var fruit_4 : int = 0;

		private var fruit_5 : int = 0;

		private var fruit_6 : int = 0;

		private var fruit_7 : int = 0;

		private var fruit_8 : int = 0;

		public function Game ()
		{

			//初始化状态
			//监听开始按钮事件
			this.btn_go.on ( Event.MOUSE_DOWN , this , onStart );

			//为每个button添加鼠标事件
			this.btn_1.on ( Event.MOUSE_DOWN , this , onFruit , [ 'fruit_1' ]);
			this.btn_2.on ( Event.MOUSE_DOWN , this , onFruit , [ 'fruit_2' ]);
			this.btn_3.on ( Event.MOUSE_DOWN , this , onFruit , [ 'fruit_3' ]);
			this.btn_4.on ( Event.MOUSE_DOWN , this , onFruit , [ 'fruit_4' ]);
			this.btn_5.on ( Event.MOUSE_DOWN , this , onFruit , [ 'fruit_5' ]);
			this.btn_6.on ( Event.MOUSE_DOWN , this , onFruit , [ 'fruit_6' ]);
			this.btn_7.on ( Event.MOUSE_DOWN , this , onFruit , [ 'fruit_7' ]);
			this.btn_8.on ( Event.MOUSE_DOWN , this , onFruit , [ 'fruit_8' ]);

		}

		private function onStart () : void
		{

			if ( state == false )
			{
				console.log ( "开始游戏" );
				state = true;
			}
			else
			{
				console.log ( "正在游戏中" );
			}

		}

		private function onFruit ( fruit ) : void
		{

			//增加
			if ( addOrdel == false )
			{
				switch ( fruit )
				{
					case "fruit_1":
					{
						if ( fruit_1 < 99 )
						{
							fruit_1++;
							this.fruit_1_t.skin = "gameUI/num" + Math.floor ( fruit_1 / 10 ) + ".png";
							this.fruit_1_o.skin = "gameUI/num" + fruit_1 % 10 + ".png";
						}
						break;
					}
					case "fruit_2":
					{
						if ( fruit_2 < 99 )
						{
							fruit_2++;
							this.fruit_2_t.skin = "gameUI/num" + Math.floor ( fruit_2 / 10 ) + ".png";
							this.fruit_2_o.skin = "gameUI/num" + fruit_2 % 10 + ".png";
						}
						break;
					}
					case "fruit_3":
					{
						if ( fruit_3 < 99 )
						{
							fruit_3++;
							this.fruit_3_t.skin = "gameUI/num" + Math.floor ( fruit_3 / 10 ) + ".png";
							this.fruit_3_o.skin = "gameUI/num" + fruit_3 % 10 + ".png";
						}

						break;
					}
					case "fruit_4":
					{
						if ( fruit_4 < 99 )
						{
							fruit_4++;
							this.fruit_4_t.skin = "gameUI/num" + Math.floor ( fruit_4 / 10 ) + ".png";
							this.fruit_4_o.skin = "gameUI/num" + fruit_4 % 10 + ".png";
						}

						break;
					}
					case "fruit_5":
					{
						if ( fruit_5 < 99 )
						{
							fruit_5++;
							this.fruit_5_t.skin = "gameUI/num" + Math.floor ( fruit_5 / 10 ) + ".png";
							this.fruit_5_o.skin = "gameUI/num" + fruit_5 % 10 + ".png";
						}

						break;
					}
					case "fruit_6":
					{
						if ( fruit_6 < 99 )
						{
							fruit_6++;
							this.fruit_6_t.skin = "gameUI/num" + Math.floor ( fruit_6 / 10 ) + ".png";
							this.fruit_6_o.skin = "gameUI/num" + fruit_6 % 10 + ".png";
						}
						break;
					}
					case "fruit_7":
					{
						if ( fruit_7 < 99 )
						{
							fruit_7++;
							this.fruit_7_t.skin = "gameUI/num" + Math.floor ( fruit_7 / 10 ) + ".png";
							this.fruit_7_o.skin = "gameUI/num" + fruit_7 % 10 + ".png";
						}
						break;
					}
					case "fruit_8":
					{
						if ( fruit_8 < 99 )
						{
							fruit_8++;
							this.fruit_8_t.skin = "gameUI/num" + Math.floor ( fruit_8 / 10 ) + ".png";
							this.fruit_8_o.skin = "gameUI/num" + fruit_8 % 10 + ".png";
						}
						break;
					}

					default:
					{
						break;
					}
				}
			}
			//减少
			else
			{

			}

		}

		private function updateFruitUI () : void
		{

		}


		/**
		 * 生成随机位置
		 *
		 */
		private function randomPos () : void
		{

			var randnum : int = Math.random ();

		}

		private function runCircle () : void
		{
			//完成后,发送消息事件
		}
	}
}
