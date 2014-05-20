package Tick_Tack_Toe 
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import Tick_Tack_Toe.Cell;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	
	public class Level  extends Sprite
	{
		/*Загрузка картинок -------------------------------*/
		[Embed(source = '../../images/Walle-X.png')]
		public static var XImage1:Class;
		[Embed(source = '../../images/Walle-X-b-w.png')]
		public static var XImage2:Class;
		[Embed(source = '../../images/Walle-O.png')]
		public static var OImage1:Class;
		[Embed(source = '../../images/Walle-O-b-w.png')]
		public static var OImage2:Class;
		
		/*Загрузка звуков ---------------------------------*/
		[Embed(source = '../../sounds/sound1.mp3')]
		public static var SoundWalle:Class;
		[Embed(source = '../../sounds/sound2.mp3')]
		public static var SoundClick:Class;
		[Embed(source = '../../sounds/hit.MP3')]
		public static var SoundClick2:Class;
		[Embed(source = '../../sounds/select.MP3')]
		public static var SoundPers:Class;
		[Embed(source = '../../sounds/sound4.mp3')]
		public static var SoundWin:Class;
		
		/*Звук*/
		public static var snd1:Sound = new Level.SoundWalle() as Sound;
		public static var snd2:Sound = new Level.SoundClick() as Sound;
		public static var snd3:Sound = new Level.SoundPers() as Sound;
		public static var snd4:Sound = new Level.SoundWin() as Sound;
		public static var snd5:Sound = new Level.SoundClick2() as Sound;
		
		/*Флаг очерёдности (по умолчанию - крестик)*/
		public static var turn:Boolean;
		/*Флаг завершения игры*/
		public static var endGame:Boolean = false;
		/*состояние ячейки. (по умолчению пусто)
		 * 0 - по умолчанию значит ячейка не активна
		 * 1 - это крестик
		 * 2 - это нолик
		 * 10 - пользователь
		 * 11 - ИИ (искуственный интелект)
		 * */
		public static var indexState:Array = [10, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		/*Статистика игры*/
		public static var totalGame:Array = new Array();
		private var _totalMoves:int;
		private var _winner:int;
		/*Координаты перечёркивающей линии*/
		public static var LineX1, LineY1, LineX2, LineY2:int;
		
		public function Level() 
		{
			this.x = 50;
			this.y = 50;
			Start();
		}
		
		private const SIZE_CELL:int = 76;
		private const PADDING_CELL:int = 50;
		
		public function Start()
		{
			//Создание игрового поля
			var _createField:Cell;
			for (var i:int = 0; i < 3; i++) {
				for (var j:int = 0; j < 3; j++) {
					_createField = new Cell (SIZE_CELL * j + PADDING_CELL * j, SIZE_CELL * i + PADDING_CELL * i);
					_createField.addEventListener (Event.CHANGE, onChange);
					_createField.Index = i * 3 + j + 1;
					this.addChild(_createField);
				}
			}
		}
		
		private function onChange(e:Event):void {
			//проверка завершения ходов
			if (endGame || indexState.indexOf(0) < 0) Reset();
			//проверка выигрыша
			CheckGame ();
			//ход искуственного интелекта
			if (indexState[0] == 11) {
				var i:int = GameAI.GameAIStroke() - 1;
				var cell:Object = this.getChildAt(i);
				cell.ChangePC();
				//проверка выигрыша
				CheckGame ();
			}
			_totalMoves++; //сохраняем количество ходов пользователя
		}
		
		public function CheckGame()
		{
			_winner = check();
			if (_winner != 0) { //вывод результата
				if(Options.soundOffOn) snd4.play(); //воспроизведение звука
				var _line:Sprite = new Sprite();
				_line.graphics.lineStyle(10, 0x3415E1, .75);
				_line.graphics.moveTo(LineX1, LineY1)
				_line.graphics.lineTo(LineX2, LineY2);
				addChild(_line);
				endGame = true;
			}
		}
		
		public function check():int
		{
			//ГОРИЗОНТАЛЬНО -------------------------------------------------------
			//ячейки 1, 2, 3
			if (indexState[1] == indexState[2] && indexState[2] == indexState[3] && indexState[2] != 0) {
				LineX1 = 10; LineY1 = 40; LineX2 = 330; LineY2 = 40;
				return indexState[2];
			}
			//ячейки 4, 5, 6
			if (indexState[4] == indexState[5] && indexState[5] == indexState[6] && indexState[5] != 0) {
				LineX1 = 10; LineY1 = 165; LineX2 = 330; LineY2 = 165;
				return indexState[5];
			}
			//ячейки 7, 8, 9
			if (indexState[7] == indexState[8] && indexState[8] == indexState[9] && indexState[8] != 0) {
				LineX1 = 10; LineY1 = 290; LineX2 = 330; LineY2 = 290;
				return indexState[8];
			}
			//ВЕРТИКАЛЬНО ---------------------------------------------------------
			//ячейки 1, 4, 7
			if (indexState[1] == indexState[4] && indexState[4] == indexState[7] && indexState[4] != 0) {
				LineX1 = 40; LineY1 = 40; LineX2 = 40; LineY2 = 290;
				return indexState[4];
			}
			//ячейки 2, 5, 8
			if (indexState[2] == indexState[5] && indexState[5] == indexState[8] && indexState[5] != 0) {
				LineX1 = 165; LineY1 = 40; LineX2 = 165; LineY2 = 290;
				return indexState[5];
			}
			//ячейки 3, 6, 9
			if (indexState[3] == indexState[6] && indexState[6] == indexState[9] && indexState[6] != 0) {
				LineX1 = 290; LineY1 = 40; LineX2 = 290; LineY2 = 290;
				return indexState[6];
			}
			//ПЕРЕСЕЧЕНИЕ ---------------------------------------------------------
			//ячейки 1, 5, 9
			if (indexState[1] == indexState[5] && indexState[5] == indexState[9] && indexState[5] != 0) {
				LineX1 = 10; LineY1 = 10; LineX2 = 290; LineY2 = 290;
				return indexState[5];
			}
			//ячейки 3, 5, 7
			if (indexState[3] == indexState[5] && indexState[5] == indexState[7] && indexState[5] != 0) {
				LineX1 = 10; LineY1 = 320; LineX2 = 290; LineY2 = 40;
				return indexState[5];
			}
			return 0;
		}
		
		//Сброс игры
		public function Reset()
		{
			/*Сохранение статистики*/
			totalGame.push([_winner, _totalMoves]);
			/*Очистка уровня.*/
			indexState = new Array(10, 0, 0, 0, 0, 0, 0, 0, 0, 0)
			_winner = 0; //флаг победителя
			_totalMoves = 0; //количество ходов пользователя.
			while (this.numChildren) this.removeChildAt(0);
			endGame = false;
			turn = Options.turnXO;
			Start();
		}
		
	}

}