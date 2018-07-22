package
{

	import laya.events.Event;
	import laya.ui.Image;
	import laya.utils.Browser;
	import ui.GameUI;

	public class Game extends GameUI
	{
		/**当前游戏状态***/
		private var state:Boolean;

		/**当前是增加还是减少***/
		private var addOrdel:Boolean;

		/**每种水果初始值***/
		private var fruitCount:Array = [
			0 , //苹果
			0 , //苹果*3
			0 , //橘子
			0 , //橘子*3
			0 , //梨
			0 , //梨*3
			0 , //铃铛
			0 , //铃铛*3
			0 , //西瓜
			0 , //西瓜*3
			0 , //星星
			0 , //星星*3
			0 , //77
			0 , //77*3
			0 , //BOSS*50
			0 , //BOSS*120
			0 //goodluck

			];

		/**每种水果的倍率***/
		private var fruitrate:Array = [
			5 , //苹果
			15 , //苹果*3
			10 , //橘子
			30 , //橘子*3
			10 , //梨
			30 , //梨*3
			15 , //铃铛
			45 , //铃铛*3
			20 , //西瓜
			60 , //西瓜*3
			30 , //星星
			90 , //星星*3
			40 , //77
			120 , //77*3
			600 , //BOSS*50
			1200 , //BOSS*120
			0 //goodluck
			];

		/**每种水果对应位置,未用到,待删除***/
		private var fruit_pos:Array = [
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
		private var fruit_posnum:Array = [
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

		/**跑圈时间间隔***/
		private var circleInterval_fast:Number = 25;

		private var circleInterval_middle:Number = 100;

		private var circleInterval_slow:Number = 300;

		/**跑圈时间计时***/
		private var circleTime:Number = 25;

		/**上一次的位置***/
		private var prePos:Image;

		/**跑圈次数***/
		private var randPos:int;

		/**当前位置***/
		private var curPos:Image;

		/**当前位置编号***/
		private var curPosNum:int;

		/**水果类型***/
		private var fruit_type:int; //若加入奖励设置,类型应该为数组

		/**总分***/
		private var total_score:int;

		/**当前得分***/
		private var cur_score:int;

		/**得分时间间隔***/
		private var scoreInterval:Number = 25;

		/**分数时间计时**/
		private var scoreTime:Number = 25;



		public function Game ()
		{

			//游戏初始化
			init ();
			//事件监听
			listen ();


		}

		private function listen ():void
		{

			//开始按钮点击事件
			this.btn_go.on ( Event.MOUSE_DOWN , this , onStart );
			//跑圈完成事件
			this.on ( "circleComplete" , this , circleComplete );
			//投币按钮点击事件
			this.btn_coin.on ( Event.MOUSE_DOWN , this , onScore );
			//为每个button添加鼠标事件
			this.btn_1.on ( Event.MOUSE_DOWN , this , onFruit , [ 'fruit_1' ] );
			this.btn_2.on ( Event.MOUSE_DOWN , this , onFruit , [ 'fruit_2' ] );
			this.btn_3.on ( Event.MOUSE_DOWN , this , onFruit , [ 'fruit_3' ] );
			this.btn_4.on ( Event.MOUSE_DOWN , this , onFruit , [ 'fruit_4' ] );
			this.btn_5.on ( Event.MOUSE_DOWN , this , onFruit , [ 'fruit_5' ] );
			this.btn_6.on ( Event.MOUSE_DOWN , this , onFruit , [ 'fruit_6' ] );
			this.btn_7.on ( Event.MOUSE_DOWN , this , onFruit , [ 'fruit_7' ] );
			this.btn_8.on ( Event.MOUSE_DOWN , this , onFruit , [ 'fruit_8' ] );

		}

		private function init ():void
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
			//默认总分为0
			this.total_score = 0;
			//默认当前分数为0
			this.cur_score = 0;
			//默认游戏状态为0,代表没有开始游戏
			this.state = false;
			//默认增加或者减少为增加
			this.addOrdel = false;
			//默认上一次位置为0位置
			this.prePos = this.pos_0;

		}

		private function onScore ():void
		{

			//判断总分+10后是否大于9999
			if ( this.total_score + 10 <= 9999 )
			{
				this.total_score += 10;
				this.cur_score = this.total_score;
				updateScoreUI ( this.cur_score );
			}


		}

		private function onStart ():void
		{

			if ( state == false )
			{
				console.log ( "开始游戏" );
				//禁用各种按钮
				this.curPosNum = 0;
				randPos = randomPos ();
				//跑圈循环
				Laya.timer.frameLoop ( 1 , this , CircleLoop );
			}
			else
			{
				console.log ( "正在游戏中" );
			}

		}

		private function CircleLoop ():void
		{

			runCircle ();

		}

		private function onFruit ( fruit ):void
		{

			//增加
			if ( addOrdel == false )
			{
				switch ( fruit )
				{
					case "fruit_1":
					{
						if ( this.total_score - 5 >= 0 )
						{
							if ( fruitCount[ 0 ] < 99 )
							{
								fruitCount[ 0 ]++;
								fruitCount[ 1 ] = fruitCount[ 0 ];
								this.fruit_1_t.skin = "gameUI/num" + Math.floor ( fruitCount[ 0 ] / 10 ) + ".png";
								this.fruit_1_o.skin = "gameUI/num" + fruitCount[ 0 ] % 10 + ".png";
								this.total_score -= 5;
								this.cur_score = this.total_score;
								updateScoreUI ( this.cur_score );
							}
						}


						break;
					}
					case "fruit_2":
					{
						if ( this.total_score - 10 >= 0 )
						{
							if ( fruitCount[ 2 ] < 99 )
							{
								fruitCount[ 2 ]++;
								fruitCount[ 3 ] = fruitCount[ 2 ];
								this.fruit_2_t.skin = "gameUI/num" + Math.floor ( fruitCount[ 2 ] / 10 ) + ".png";
								this.fruit_2_o.skin = "gameUI/num" + fruitCount[ 2 ] % 10 + ".png";
								this.total_score -= 10;
								this.cur_score = this.total_score;
								updateScoreUI ( this.cur_score );
							}
						}
						break;
					}
					case "fruit_3":
					{
						if ( this.total_score - 10 >= 0 )
						{
							if ( fruitCount[ 4 ] < 99 )
							{
								fruitCount[ 4 ]++;
								fruitCount[ 5 ] = fruitCount[ 4 ];
								this.fruit_3_t.skin = "gameUI/num" + Math.floor ( fruitCount[ 4 ] / 10 ) + ".png";
								this.fruit_3_o.skin = "gameUI/num" + fruitCount[ 4 ] % 10 + ".png";
								this.total_score -= 10;
								this.cur_score = this.total_score;
								updateScoreUI ( this.cur_score );
							}
						}

						break;
					}
					case "fruit_4":
					{
						if ( this.total_score - 15 >= 0 )
						{
							if ( fruitCount[ 6 ] < 99 )
							{
								fruitCount[ 6 ]++;
								fruitCount[ 7 ] = fruitCount[ 6 ];
								this.fruit_4_t.skin = "gameUI/num" + Math.floor ( fruitCount[ 6 ] / 10 ) + ".png";
								this.fruit_4_o.skin = "gameUI/num" + fruitCount[ 6 ] % 10 + ".png";
								this.total_score -= 15;
								this.cur_score = this.total_score;
								updateScoreUI ( this.cur_score );
							}
						}

						break;
					}
					case "fruit_5":
					{
						if ( this.total_score - 20 >= 0 )
						{
							if ( fruitCount[ 8 ] < 99 )
							{
								fruitCount[ 8 ]++;
								fruitCount[ 9 ] = fruitCount[ 8 ];
								this.fruit_5_t.skin = "gameUI/num" + Math.floor ( fruitCount[ 8 ] / 10 ) + ".png";
								this.fruit_5_o.skin = "gameUI/num" + fruitCount[ 8 ] % 10 + ".png";
								this.total_score -= 20;
								this.cur_score = this.total_score;
								updateScoreUI ( this.cur_score );
							}
						}

						break;
					}
					case "fruit_6":
					{
						if ( this.total_score - 30 >= 0 )
						{
							if ( fruitCount[ 10 ] < 99 )
							{
								fruitCount[ 10 ]++;
								fruitCount[ 11 ] = fruitCount[ 10 ];
								this.fruit_6_t.skin = "gameUI/num" + Math.floor ( fruitCount[ 10 ] / 10 ) + ".png";
								this.fruit_6_o.skin = "gameUI/num" + fruitCount[ 10 ] % 10 + ".png";
								this.total_score -= 30;
								this.cur_score = this.total_score;
								updateScoreUI ( this.cur_score );
							}
						}
						break;
					}
					case "fruit_7":
					{
						if ( this.total_score - 40 >= 0 )
						{
							if ( fruitCount[ 12 ] < 99 )
							{
								fruitCount[ 12 ]++;
								fruitCount[ 13 ] = fruitCount[ 12 ];
								this.fruit_7_t.skin = "gameUI/num" + Math.floor ( fruitCount[ 12 ] / 10 ) + ".png";
								this.fruit_7_o.skin = "gameUI/num" + fruitCount[ 12 ] % 10 + ".png";
								this.total_score -= 40;
								this.cur_score = this.total_score;
								updateScoreUI ( this.cur_score );
							}
						}
						break;
					}
					case "fruit_8":
					{
						if ( this.total_score - 120 >= 0 )
						{
							if ( fruitCount[ 14 ] < 99 )
							{
								fruitCount[ 14 ]++;
								fruitCount[ 15 ] = fruitCount[ 14 ];
								this.fruit_8_t.skin = "gameUI/num" + Math.floor ( fruitCount[ 14 ] / 10 ) + ".png";
								this.fruit_8_o.skin = "gameUI/num" + fruitCount[ 14 ] % 10 + ".png";
								this.total_score -= 120;
								this.cur_score = this.total_score;
								updateScoreUI ( this.cur_score );
							}
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



		/**
		 * 生成随机位置
		 *
		 */
		private function randomPos ():int
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
			var randnum:int = Math.round ( Math.random () * 140 );
			//console.log ( randnum );
			/**
			 *  位置计算公式为:圈数*24+水果位置
			 *  圈数为随机 2~3
			 *  水果位置为水果类型下具体每个位置的编号
			 */
			var circleNum:int = Math.round ( Math.random () * 1 ) + 2;
			var pos:int = circleNum * 24;
			var index:int;



			if ( randnum == 1 )
			{
				pos += fruit_posnum[ 15 ][ 0 ];
				fruit_type = 15;
			}
			else if ( randnum == 2 )
			{
				pos += fruit_posnum[ 14 ][ 0 ];
				fruit_type = 14;
			}
			else if ( randnum >= 3 && randnum <= 5 )
			{
				pos += fruit_posnum[ 13 ][ 0 ];
				fruit_type = 13;
			}
			else if ( randnum >= 6 && randnum <= 8 )
			{
				pos += fruit_posnum[ 12 ][ 0 ];
				fruit_type = 12;
			}
			else if ( randnum >= 9 && randnum <= 12 )
			{
				pos += fruit_posnum[ 11 ][ 0 ];
				fruit_type = 11;
			}
			else if ( randnum >= 13 && randnum <= 16 )
			{
				pos += fruit_posnum[ 10 ][ 0 ];
				fruit_type = 10;
			}
			else if ( randnum >= 17 && randnum <= 22 )
			{
				pos += fruit_posnum[ 9 ][ 0 ];
				fruit_type = 9;
			}
			else if ( randnum >= 23 && randnum <= 28 )
			{
				pos += fruit_posnum[ 8 ][ 0 ];
				fruit_type = 8;
			}
			else if ( randnum >= 29 && randnum <= 36 )
			{
				pos += fruit_posnum[ 7 ][ 0 ];
				fruit_type = 7;
			}
			else if ( randnum >= 37 && randnum <= 44 )
			{
				index = Math.round ( Math.random () * ( fruit_posnum[ 6 ].length - 1 ) );
				pos += fruit_posnum[ 6 ][ index ];
				fruit_type = 6;
			}
			else if ( randnum >= 45 && randnum <= 56 )
			{
				pos += fruit_posnum[ 5 ][ 0 ];
				fruit_type = 5;
			}
			else if ( randnum >= 57 && randnum <= 68 )
			{
				index = Math.round ( Math.random () * ( fruit_posnum[ 4 ].length - 1 ) );
				pos += fruit_posnum[ 4 ][ index ];
				fruit_type = 4;
			}
			else if ( randnum >= 69 && randnum <= 80 )
			{
				pos += fruit_posnum[ 3 ][ 0 ];
				fruit_type = 3;
			}
			else if ( randnum >= 81 && randnum <= 92 )
			{
				index = Math.round ( Math.random () * ( fruit_posnum[ 2 ].length - 1 ) );
				pos += fruit_posnum[ 2 ][ index ];
				fruit_type = 2;
			}
			else if ( randnum >= 93 && randnum <= 116 )
			{
				pos += fruit_posnum[ 1 ][ 0 ];
				fruit_type = 1;
			}
			else if ( randnum >= 117 && randnum <= 140 )
			{
				index = Math.round ( Math.random () * ( fruit_posnum[ 0 ].length - 1 ) );
				pos += fruit_posnum[ 0 ][ index ];
				fruit_type = 0;
			}
			return pos;

		}

		private function runCircle ():void
		{

			if ( curPosNum > randPos )
			{
				//修改皮肤
				prePos.skin = "gameUI/purpleBox.png";
				//去除游戏循环
				Laya.timer.clear ( this , CircleLoop );

				//发送完成事件,监听
				this.event ( "circleComplete" );
			}
			//获取当前时间
			var time:Number = Browser.now ();

			//如果当前时间大于下次滚动时间
			if ( time > this.circleTime )
			{

				prePos.visible = false;
				curPos = num2pos ( curPosNum % 24 );

				if ( curPosNum < randPos * 0.5 )
				{
					this.circleTime = time + this.circleInterval_fast;
					curPos.skin = "gameUI/box0.png";
				}
				else if ( curPosNum < randPos * 0.75 )
				{
					this.circleTime = time + this.circleInterval_middle;
					curPos.skin = "gameUI/box1.png";
				}
				else
				{
					this.circleTime = time + this.circleInterval_slow;
					curPos.skin = "gameUI/box2.png";
				}
				curPos.visible = true;
				prePos = curPos;
				curPosNum++;
			}


		}

		private function circleComplete ():void
		{

			CalculateScore ();
			//updateScoreUI ();
			Laya.timer.frameLoop ( 1 , this , ScoreLoop );

		}

		private function ScoreLoop ():void
		{

			if ( this.cur_score == this.total_score )
			{
				//去除游戏循环
				Laya.timer.clear ( this , ScoreLoop );

					//发送完成事件,监听
					//this.event ( "Complete" );
			}
			//获取当前时间
			var time:Number = Browser.now ();

			//如果当前时间大于下次滚动时间
			if ( time > this.scoreTime )
			{
				updateScoreUI ( this.cur_score );
				this.cur_score++;

			}


		}

		private function CalculateScore ():void
		{

			var score:int = this.fruitrate[ this.fruit_type ] * this.fruitCount[ this.fruit_type ];
			this.total_score += score;

		}

		private function updateScoreUI ( score:int ):void
		{

			var thousand:int = Math.floor ( score / 1000 );
			var hundred:int = Math.floor ( ( score - thousand * 1000 ) / 100 );
			var ten:int = Math.floor ( ( score - thousand * 1000 - hundred * 100 ) / 10 );
			var one:int = score % 10;
			this.point_thousand.skin = "gameUI/points" + thousand + ".png";
			this.point_hundred.skin = "gameUI/points" + hundred + ".png";
			this.point_ten.skin = "gameUI/points" + ten + ".png";
			this.point_one.skin = "gameUI/points" + one + ".png";

		}

		private function num2pos ( num:int ):Image
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
