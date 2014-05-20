package Tick_Tack_Toe 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	public class SelectPersIcon extends Sprite
	{
		[Embed(source = '../../images/buttonUp.png')]
		private var RadioButtonSelect:Class;
		[Embed(source = '../../images/buttonDown.png')]
		private var RadioButtonNotSelect:Class;
		public var buttonChecked:Bitmap = new RadioButtonSelect;
		public var buttonNotChecked:Bitmap = new RadioButtonNotSelect;
		public var imageSelectX:Bitmap = new Level.XImage1;
		public var imageNotSelectX:Bitmap = new Level.XImage2;
		public var imageSelectO:Bitmap = new Level.OImage1;
		public var imageNotSelectO:Bitmap = new Level.OImage2;
		
		
		
		
		public function SelectPersIcon(LeftOrRight:Boolean, turn:Boolean) 
		{
			if (LeftOrRight)
			{
				/*Левая сторона*/
				/*Персонаж*/
				imageSelectX.x = 250; imageSelectX.y = 200;
				this.addChild(imageSelectX);
				imageNotSelectX.x = 250; imageNotSelectX.y = 200;
				this.addChild(imageNotSelectX);
				/*Кнопка*/
				buttonChecked.x = 267; buttonChecked.y = 285;
				this.addChild(buttonChecked);
				buttonNotChecked.x = 267; buttonNotChecked.y = 285;
				this.addChild(buttonNotChecked);
				/*Графика*/
				this.graphics.beginFill(0xFFFFFF, 0.8);
				this.graphics.drawCircle(290, 245, 60);
				this.graphics.endFill();
				this.graphics.beginFill(0x3415E1, 1.5);
				this.graphics.drawCircle(290, 245, 57);
				this.graphics.endFill();
				this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutButtonLeft);
				this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverButtonLeft);
			}else {
				/*Правая сторона*/
				/*Персонаж*/
				imageSelectO.x = 450; imageSelectO.y = 200;
				this.addChild(imageSelectO);
				imageNotSelectO.x = 450; imageNotSelectO.y = 200;
				this.addChild(imageNotSelectO);
				/*Кнопка*/
				buttonChecked.x = 473; buttonChecked.y = 285;
				this.addChild(buttonChecked);
				buttonNotChecked.x = 473; buttonNotChecked.y = 285;
				this.addChild(buttonNotChecked);
				/*Графика*/
				this.graphics.beginFill(0xFFFFFF, 0.8);
				this.graphics.drawCircle(490, 245, 60);
				this.graphics.endFill();
				this.graphics.beginFill(0x3415E1, 1.5);
				this.graphics.drawCircle(490, 245, 57);
				this.graphics.endFill();
				this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutButtonRight);
				this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverButtonRight);
			}
		}
		
		/*События левого персонажа*/
		private function onMouseOutButtonLeft(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.AUTO;
		}
		private function onMouseOverButtonLeft(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.BUTTON;
		}
		
		/*События правого персонажа*/
		private function onMouseOutButtonRight(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.AUTO;
		}
		private function onMouseOverButtonRight(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.BUTTON;
		}
	}

}