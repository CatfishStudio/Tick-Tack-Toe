package Tick_Tack_Toe 
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	public class Options extends Sprite
	{
		[Embed(source = '../../images/buttonUp.png')]
		private var BImage:Class;
		private var _bImage1:Bitmap = new BImage();
		private var _bImage2:Bitmap = new BImage();
		private var _bImage3:Bitmap = new BImage();
		[Embed(source = '../../images/buttonDown.png')]
		private var BAImage:Class;
		private var _bAImage1:Bitmap = new BAImage();
		private var _bAImage2:Bitmap = new BAImage();
		private var _bAImage3:Bitmap = new BAImage();
		
		private var _button1:Sprite = new Sprite();
		private var _button2:Sprite = new Sprite();
		private var _button3:Sprite = new Sprite();
		
		
		/*Статичные переменные настроек*/
		public static var enableAI:Boolean;
		public static var turnXO:Boolean;
		public static var soundOffOn:Boolean = true;
		
		public function Options() 
		{
			/*Рабочая область*/
			this.graphics.beginFill(0x000000, 0);
			this.graphics.drawRect(0, 0, 600, 300);
			this.graphics.endFill();
			
			/*Текст*/
			var _textLabel:Label = new Label(350, 90, 300, 50, "Aria", 16, 0xFFFFFF, "<b>НАСТРОЙКИ</b>")
			this.addChild(_textLabel);
			
			/*кнопка активации искуственного интелекта -----------------*/
			if (enableAI) {
				_bImage1.x = 200; _bImage1.y = 150;	_bImage1.alpha = 1;
				_bAImage1.x = 200; _bAImage1.y = 150; _bAImage1.alpha = 0;
			}else {
				_bImage1.x = 200; _bImage1.y = 150;	_bImage1.alpha = 0;
				_bAImage1.x = 200; _bAImage1.y = 150; _bAImage1.alpha = 1;
			}
			_button1.addChild(_bImage1);
			_button1.addChild(_bAImage1);
			_button1.addEventListener(MouseEvent.CLICK, onMouseClick_button1);
			_button1.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut_button);
			_button1.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver_button);
			this.addChild(_button1);
						
			/*Текст*/
			var _textLabel:Label = new Label(260, 160, 300, 50, "Aria", 16, 0xFFFFFF, "Вкл / Выкл искуственный интелект.")
			this.addChild(_textLabel);
			/*-----------------------------------------------------------*/
			
			/*кнопка выбора крестика или нолика  ------------------------*/
			if (turnXO) {
				_bImage2.x = 200; _bImage2.y = 250;	_bImage2.alpha = 0;
				_bAImage2.x = 200; _bAImage2.y = 250; _bAImage2.alpha = 1;
			}else {
				_bImage2.x = 200; _bImage2.y = 250;	_bImage2.alpha = 1;
				_bAImage2.x = 200; _bAImage2.y = 250; _bAImage2.alpha = 0;
			}
			_button2.addChild(_bImage2);
			_button2.addChild(_bAImage2);
			_button2.addEventListener(MouseEvent.CLICK, onMouseClick_button2);
			_button2.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut_button);
			_button2.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver_button);
			this.addChild(_button2);
			
			/*Текст*/
			var _textLabel:Label = new Label(260, 260, 300, 50, "Aria", 16, 0xFFFFFF, "Персонаж крестик / нолик.")
			this.addChild(_textLabel);
			/*-----------------------------------------------------------*/
			
			/*кнопка выбора вкл / выкл звук - ---------------------------*/
			if (soundOffOn == false) {
				_bImage3.x = 200; _bImage3.y = 350;	_bImage3.alpha = 0;
				_bAImage3.x = 200; _bAImage3.y = 350; _bAImage3.alpha = 1;
			}else {
				_bImage3.x = 200; _bImage3.y = 350;	_bImage3.alpha = 1;
				_bAImage3.x = 200; _bAImage3.y = 350; _bAImage3.alpha = 0;
			}
			_button3.addChild(_bImage3);
			_button3.addChild(_bAImage3);
			_button3.addEventListener(MouseEvent.CLICK, onMouseClick_button3);
			_button3.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut_button);
			_button3.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver_button);
			this.addChild(_button3);
			
			/*Текст*/
			var _textLabel:Label = new Label(260, 360, 300, 50, "Aria", 16, 0xFFFFFF, "Вкл / выкл звук.")
			this.addChild(_textLabel);
			/*-----------------------------------------------------------*/
		}
		
		/*События кнопки _button1*/
		private function onMouseClick_button1(e:MouseEvent):void
		{
			if(Options.soundOffOn) Level.snd5.play(); //воспроизведение звука
			if (enableAI) {
				_bImage1.alpha = 0;
				_bAImage1.alpha = 1;
				enableAI = false;
			}else {
				_bImage1.alpha = 1;
				_bAImage1.alpha = 0;
				enableAI = true;
			}
		}
		/*События кнопки _button2*/
		private function onMouseClick_button2(e:MouseEvent):void
		{
			if(Options.soundOffOn) Level.snd5.play(); //воспроизведение звука
			if (turnXO) {
				_bImage2.alpha = 1;
				_bAImage2.alpha = 0;
				turnXO = false;
			}else {
				_bImage2.alpha = 0;
				_bAImage2.alpha = 1;
				turnXO = true;
			}
		}
		/*События кнопки _button2*/
		private function onMouseClick_button3(e:MouseEvent):void
		{
			if (soundOffOn) {
				_bImage3.alpha = 0;
				_bAImage3.alpha = 1;
				soundOffOn = false;
			}else {
				_bImage3.alpha = 1;
				_bAImage3.alpha = 0;
				soundOffOn = true;
			}
			if(Options.soundOffOn) Level.snd5.play(); //воспроизведение звука
		}
		
		/*Общее событие для всех кнопок*/
		private function onMouseOut_button(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.AUTO;
		}
		private function onMouseOver_button(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.BUTTON;
		}
	}

}