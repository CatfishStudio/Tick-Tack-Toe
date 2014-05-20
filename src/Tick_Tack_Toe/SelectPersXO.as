package Tick_Tack_Toe 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.StyleSheet;
	import flash.text.TextFormat;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import Tick_Tack_Toe.SelectPersIcon;
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	public class SelectPersXO extends Sprite
	{
		[Embed(source = '../../images/Tick_Tack_Toe.png')]
		private var TTT:Class;
		private var _gameName:Bitmap = new TTT();
		
		private var _iconLeft:SelectPersIcon;
		private var _iconRight:SelectPersIcon;
		
		public function SelectPersXO() 
		{
			/*Наименование игры "Крестики-нолики"*/
			_gameName.x = 185; _gameName.y = 80;
			this.addChild(_gameName);
			
			/*Рабочая область*/
			this.graphics.beginFill(0x000000, 0);
			this.graphics.drawRect(0, 0, 600, 300);
			this.graphics.endFill();
			
			/*Иконки персонажей*/
			_iconLeft = new SelectPersIcon(true, Level.turn);
			_iconLeft.addEventListener(MouseEvent.CLICK, onMouseClickButtonLeft);
			
			this.addChild(_iconLeft);
			_iconRight = new SelectPersIcon(false, Level.turn);
			_iconRight.addEventListener(MouseEvent.CLICK, onMouseClickButtonRight);
			this.addChild(_iconRight);
			
			Level.turn = SelectPers(Level.turn);
			
			/*Текст*/
			var _textLabel:Label = new Label(220, 350, 400, 50, "Aria", 16, 0xFFFFFF, "<b>Выберите персонаж которым будете играть.<b>")
			this.addChild(_textLabel);
			
		}
		
		private function SelectPers(turn:Boolean):Boolean
		{
			if (turn == false) {
				_iconLeft.imageSelectX.alpha = 1;
				_iconLeft.imageNotSelectX.alpha = 0;
				_iconRight.imageSelectO.alpha = 0;
				_iconRight.imageNotSelectO.alpha = 1;
				_iconLeft.buttonChecked.alpha = 1;
				_iconLeft.buttonNotChecked.alpha = 0;
				_iconRight.buttonChecked.alpha = 0;
				_iconRight.buttonNotChecked.alpha = 1;
				return false;
			}else {
				_iconLeft.imageSelectX.alpha = 0;
				_iconLeft.imageNotSelectX.alpha = 1;
				_iconRight.imageSelectO.alpha = 1;
				_iconRight.imageNotSelectO.alpha = 0;
				_iconLeft.buttonChecked.alpha = 0;
				_iconLeft.buttonNotChecked.alpha = 1;
				_iconRight.buttonChecked.alpha = 1;
				_iconRight.buttonNotChecked.alpha = 0;
				return true;
			}
		}
		
		
		/*События левой кнопки*/
		private function onMouseClickButtonLeft(e:MouseEvent):void
		{
			if(Options.soundOffOn) Level.snd3.play(); //воспроизведение звука
			Level.turn = SelectPers(false);
			Options.turnXO = Level.turn;
		}
		
		
		/*События правой кнопки*/
		private function onMouseClickButtonRight(e:MouseEvent):void
		{
			if(Options.soundOffOn) Level.snd3.play(); //воспроизведение звука
			Level.turn = SelectPers(true);
			Options.turnXO = Level.turn;
		}
		
	}

}