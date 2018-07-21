package
{

	import laya.events.Event;
	import laya.ui.Button;
	import laya.ui.Image;
	import laya.utils.Browser;

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

		/**每种水果对应位置***/
		private var fruit_pos : Array = [
			[ this.pos_5 , this.pos_11 , this.pos_17 , this.pos_23 ] , //苹果
			[ this.pos_4 ] , //苹果*3
			[ this.pos_9 , this.pos_21 ] , //橘子
			[ this.pos_22 ] , //橘子*3
			[ this.pos_3 , this.pos_15 ] , //梨
			[ this.pos_16 ] , //梨*3
			[ this.pos_8 , this.pos_20 ] , //铃铛
			[ this.pos_10 ] , //铃铛*3
			[ this.pos_2 ] , //西瓜
			[ this.pos_1 ] , //西瓜*3
			[ this.pos_14 ] , //星星
			[ this.pos_13 ] , //星星*3
			[ this.pos_18 ] , //77
			[ this.pos_19 ] , //77*3
			[ this.pos_7 ] , //BOSS*50
			[ this.pos_6 ] , //BOSS*120
			[ this.pos_0 , this.pos_12 ], //goodluck
			];

		/**每种水果对应位置编号***/
		private var fruit_posnum : Array = [
			[ 5 , 11 , 17 , 23 ] , //苹果
			[ 4 ] , //苹果*3
			[ 9 , 21 ] , //橘子
			[ 22 ] , //橘子*3
			[ 3 , 15 ] , //梨
			[ 16 ] , //梨*3
			[ 8 , 20 ] , //铃铛
			[ 10 ] , //铃铛*3
			[ 2 ] , //西瓜
			[ 1 ] , //西瓜*3
			[ 14 ] , //星星
			[ 13 ] , //星星*3
			[ 18 ] , //77
			[ 19 ] , //77*3
			[ 7 ] , //BOSS*50
			[ 6 ] , //BOSS*120
			[ 0 , 12 ], //goodluck
			];

		/**时间间隔***/
		private var runInterval_fast : Number = 25;

		private var runInterval_middle : Number = 100;

		private var runInterval_slow : Number = 300;

		private var runTime : Number = 25;

		/**上一次的位置***/
		private var prePos : Image = this.pos_0;

		/**次数***/
		private var randPos : int;

		/**当前位置***/
		private var curPos : Image;

		/***当前位置编号***/
		private var curPosNum : int;

		public function Game ()
		{

			this.pos_0.visible = false;
			this.pos_1.visible = false;
			this.pos_2.visible = false;
			this.pos_3.visible = false;
			this.pos_4.visible = false;
			this.pos_5.visible = false;
			this.pos_6.visible = false;
			this.pos_7.visible = false;
			this.pos_8.visible = false;
			this.pos_9.visible = false;
			this.pos_10.visible = false;
			this.pos_11.visible = false;
			this.pos_12.visible = false;
			this.pos_13.visible = false;
			this.pos_14.visible = false;
			this.pos_15.visible = false;
			this.pos_16.visible = false;
			this.pos_17.visible = false;
			this.pos_18.visible = false;
			this.pos_19.visible = false;
			this.pos_20.visible = false;
			this.pos_21.visible = false;
			this.pos_22.visible = false;
			this.pos_23.visible = false;

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
				curPosNum = 0;
				randPos = randomPos ();
				//跑圈循环
				Laya.timer.frameLoop ( 1 , this , loop );
			}
			else
			{
				console.log ( "正在游戏中" );
			}

		}

		private function loop () : void
		{

			runCircle ();

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
		private function randomPos () : int
		{

			/**
			 *  总共26个
			 *  2个goodluck 暂无
			 *  4个苹果			117~140
			 *  1个苹果*3		93~116
			 *  2个橘子			81~92
			 *  1个橘子*3		69~80
			 *  2个梨				57~68
			 *  1个梨*3			45~56
			 *  2个铃铛			37~44
			 *  1个铃铛*3		29~36
			 *  1个西瓜			23~28
			 *  1个西瓜*3		17~22
			 *  1个星星			13~16
			 *  1个星星*3		9~12
			 *  1个77				6~8
			 *  1个77*3			3~5
			 *  1个BOSS*50	2
			 *  1个BOSS*120	1
			 */
			var randnum : int = Math.round ( Math.random () * 140 );
			//console.log ( randnum );
			/**
			 *  位置计算公式为:圈数*24+水果位置
			 *  圈数为随机 2~3
			 *  水果位置为水果类型下具体每个位置的编号
			 */
			var circleNum : int = Math.round ( Math.random () * 1 ) + 2;
			var pos : int = circleNum * 24;
			var index : int;



			if ( randnum == 1 )
			{
				pos += fruit_posnum[ 15 ][ 0 ];
			}
			else if ( randnum == 2 )
			{
				pos += fruit_posnum[ 14 ][ 0 ];
			}
			else if ( randnum >= 3 && randnum <= 5 )
			{
				pos += fruit_posnum[ 13 ][ 0 ];
			}
			else if ( randnum >= 6 && randnum <= 8 )
			{
				pos += fruit_posnum[ 12 ][ 0 ];
			}
			else if ( randnum >= 9 && randnum <= 12 )
			{
				pos += fruit_posnum[ 11 ][ 0 ];
			}
			else if ( randnum >= 13 && randnum <= 16 )
			{
				pos += fruit_posnum[ 10 ][ 0 ];
			}
			else if ( randnum >= 17 && randnum <= 22 )
			{
				pos += fruit_posnum[ 9 ][ 0 ];
			}
			else if ( randnum >= 23 && randnum <= 28 )
			{
				pos += fruit_posnum[ 8 ][ 0 ];
			}
			else if ( randnum >= 29 && randnum <= 36 )
			{
				pos += fruit_posnum[ 7 ][ 0 ];
			}
			else if ( randnum >= 37 && randnum <= 44 )
			{
				index = Math.round ( Math.random () * ( fruit_posnum[ 6 ].length - 1 ));
				pos += fruit_posnum[ 6 ][ 0 ];
			}
			else if ( randnum >= 45 && randnum <= 56 )
			{
				pos += fruit_posnum[ 5 ][ 0 ];
			}
			else if ( randnum >= 57 && randnum <= 68 )
			{
				index = Math.round ( Math.random () * ( fruit_posnum[ 4 ].length - 1 ));
				pos += fruit_posnum[ 4 ][ 0 ];
			}
			else if ( randnum >= 69 && randnum <= 80 )
			{
				pos += fruit_posnum[ 3 ][ 0 ];
			}
			else if ( randnum >= 81 && randnum <= 92 )
			{
				index = Math.round ( Math.random () * ( fruit_posnum[ 2 ].length - 1 ));
				pos += fruit_posnum[ 2 ][ 0 ];
			}
			else if ( randnum >= 93 && randnum <= 116 )
			{
				pos += fruit_posnum[ 1 ][ 0 ];
			}
			else if ( randnum >= 117 && randnum <= 140 )
			{
				index = Math.round ( Math.random () * ( fruit_posnum[ 0 ].length - 1 ));
				pos += fruit_posnum[ 0 ][ 0 ];
			}
			return pos;

		}

		private function runCircle () : void
		{

			if ( curPosNum > randPos )
			{
				//去除游戏循环
				Laya.timer.clear ( this , loop );
					//其他功能...
					//完成后,发送消息事件
			}
			//获取当前时间
			var time : Number = Browser.now ();

			//如果当前时间大于下次滚动时间
			if ( time > this.runTime )
			{


				if ( curPosNum < randPos * 0.5 )
				{
					this.runTime = time + this.runInterval_fast;
				}
				else if ( curPosNum < randPos * 0.75 )
				{
					this.runTime = time + this.runInterval_middle;
				}
				else
				{
					this.runTime = time + this.runInterval_slow;
				}

				prePos.visible = false;
				curPos = num2pos ( curPosNum % 24 );
				curPos.visible = true;
				prePos = curPos;
				curPosNum++;
			}


		}

		private function num2pos ( num : int ) : Image
		{

			switch ( num )
			{
				case 0:
				{

					return this.pos_0;
				}
				case 1:
				{

					return this.pos_1;
				}
				case 2:
				{

					return this.pos_2;
				}
				case 3:
				{

					return this.pos_3;
				}
				case 4:
				{

					return this.pos_4;
				}
				case 5:
				{

					return this.pos_5;
				}
				case 6:
				{

					return this.pos_6;
				}
				case 7:
				{

					return this.pos_7;
				}
				case 8:
				{

					return this.pos_8;
				}
				case 9:
				{

					return this.pos_9;
				}
				case 10:
				{

					return this.pos_10;
				}
				case 11:
				{

					return this.pos_11;
				}
				case 12:
				{

					return this.pos_12;
				}
				case 13:
				{

					return this.pos_13;
				}
				case 14:
				{

					return this.pos_14;
				}
				case 15:
				{

					return this.pos_15;
				}
				case 16:
				{

					return this.pos_16;
				}
				case 17:
				{

					return this.pos_17;
				}
				case 18:
				{

					return this.pos_18;
				}
				case 19:
				{

					return this.pos_19;
				}
				case 20:
				{

					return this.pos_20;
				}
				case 21:
				{

					return this.pos_21;
				}
				case 22:
				{

					return this.pos_22;
				}
				case 23:
				{

					return this.pos_23;
				}
			}
			return null;

		}
	}
}
