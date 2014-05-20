package Tick_Tack_Toe 
{
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	public class GameAI 
	{
		
		public function GameAI() 
		{
			
		}
		
		/*Работа Искуственного Интелекта*/
		static function GameAIStroke():int
		{
			
			if (Level.turn) {
				/*ИИ играет за нолики
				 * 2 - ИИ (Нолик) 1 - Юзер (Крестик)
				 */
				if (Level.indexState.indexOf(2) < 0) {
					return FirstStroke(2, 1); //Искуственный интелект ходит в первый раз
				}else {
					return Stroke(2, 1); //Последующие ходы ИИ
				}
			}else {
				/*ИИ играет за крестики
				 * 1 - ИИ (Крестик) 2 - Юзер (Нолик)
				 */
				if (Level.indexState.indexOf(1) < 0) {
					return FirstStroke(1, 2); //Искуственный интелект ходит в первый раз
				}else {
					return Stroke(1, 2); //Последующие ходы ИИ
				}
			}
			
			return 0;
		}
		
		/*Первый ход ИИ (его случайный выбор)*/
		static function FirstStroke(turnPC:int, turnUser:int):int
		{
			var indexRandom:Number = Math.random() * 10;
			var index:int = Math.round(indexRandom);
			if (index == 0 || index == 10) index = 1;
			do {
				if (Level.indexState[index] != turnUser && Level.indexState[index] == 0 && Level.indexState[index] != turnPC) {
					break;
					return index;
				}else {
					indexRandom = Math.random() * 10;
					index = Math.round(indexRandom);
					if (index == 0 || index == 10) index = 1;
				}
			}while (Level.indexState[index] == turnUser || Level.indexState[index] == turnPC);
			
			return index;
		}
		
		/*Ход Искуственного Интелекта*/
		static function Stroke(turnPC:int, turnUser:int):int
		{
			/* Логика:
			 * 1-2-3  |1=2->3|2=3->1|1=3->2|
			 * 4-5-6  |4=5->6|5=6->4|4=6->5|
			 * 7-8-9  |7=8->9|8=9->7|7=9->8|
			 * */
			/*Проверка состояния Искуственного Интелекта --------------------------------------*/
			//	ГОРИЗОНТАЛЬ  ячейки 1, 2, 3
			if (Level.indexState[1] == Level.indexState[2] && Level.indexState[1] == turnPC && Level.indexState[3] == 0) return 3;
			if (Level.indexState[2] == Level.indexState[3] && Level.indexState[2] == turnPC && Level.indexState[1] == 0) return 1;
			if (Level.indexState[1] == Level.indexState[3] && Level.indexState[1] == turnPC && Level.indexState[2] == 0) return 2;
			//	ГОРИЗОНТАЛЬ  ячейки 4, 5, 6
			if (Level.indexState[4] == Level.indexState[5] && Level.indexState[4] == turnPC && Level.indexState[6] == 0) return 6;
			if (Level.indexState[5] == Level.indexState[6] && Level.indexState[5] == turnPC && Level.indexState[4] == 0) return 4;
			if (Level.indexState[4] == Level.indexState[6] && Level.indexState[4] == turnPC && Level.indexState[5] == 0) return 5;
			//	ГОРИЗОНТАЛЬ  ячейки 7, 8, 9
			if (Level.indexState[7] == Level.indexState[8] && Level.indexState[7] == turnPC && Level.indexState[9] == 0) return 9;
			if (Level.indexState[8] == Level.indexState[9] && Level.indexState[8] == turnPC && Level.indexState[7] == 0) return 7;
			if (Level.indexState[7] == Level.indexState[9] && Level.indexState[7] == turnPC && Level.indexState[8] == 0) return 8;
			//	ВЕРТИКАЛЬ  ячейки 1, 4, 7
			if (Level.indexState[1] == Level.indexState[4] && Level.indexState[1] == turnPC && Level.indexState[7] == 0) return 7;
			if (Level.indexState[4] == Level.indexState[7] && Level.indexState[4] == turnPC && Level.indexState[1] == 0) return 1;
			if (Level.indexState[1] == Level.indexState[7] && Level.indexState[1] == turnPC && Level.indexState[4] == 0) return 4;
			//	ВЕРТИКАЛЬ  ячейки 2, 5, 8
			if (Level.indexState[2] == Level.indexState[5] && Level.indexState[2] == turnPC && Level.indexState[8] == 0) return 8;
			if (Level.indexState[5] == Level.indexState[8] && Level.indexState[5] == turnPC && Level.indexState[2] == 0) return 2;
			if (Level.indexState[2] == Level.indexState[8] && Level.indexState[2] == turnPC && Level.indexState[5] == 0) return 5;
			//	ВЕРТИКАЛЬ  ячейки 3, 6, 9
			if (Level.indexState[3] == Level.indexState[6] && Level.indexState[3] == turnPC && Level.indexState[9] == 0) return 9;
			if (Level.indexState[6] == Level.indexState[9] && Level.indexState[6] == turnPC && Level.indexState[3] == 0) return 3;
			if (Level.indexState[3] == Level.indexState[9] && Level.indexState[3] == turnPC && Level.indexState[6] == 0) return 6;
			//	НАКРЕСТ  ячейки 1, 5, 9
			if (Level.indexState[1] == Level.indexState[5] && Level.indexState[1] == turnPC && Level.indexState[9] == 0) return 9;
			if (Level.indexState[5] == Level.indexState[9] && Level.indexState[5] == turnPC && Level.indexState[1] == 0) return 1;
			if (Level.indexState[1] == Level.indexState[9] && Level.indexState[1] == turnPC && Level.indexState[5] == 0) return 5;
			//	НАКРЕСТ  ячейки 3, 5, 7
			if (Level.indexState[3] == Level.indexState[5] && Level.indexState[3] == turnPC && Level.indexState[7] == 0) return 7;
			if (Level.indexState[5] == Level.indexState[7] && Level.indexState[5] == turnPC && Level.indexState[3] == 0) return 3;
			if (Level.indexState[3] == Level.indexState[7] && Level.indexState[3] == turnPC && Level.indexState[7] == 0) return 5;
			/*----------------------------------------------------------------------*/
				/*Проверка состояния Пользователя --------------------------------------*/
			//	ГОРИЗОНТАЛЬ  ячейки 1, 2, 3
			if (Level.indexState[1] == Level.indexState[2] && Level.indexState[1] == turnUser && Level.indexState[3] == 0) return 3;
			if (Level.indexState[2] == Level.indexState[3] && Level.indexState[2] == turnUser && Level.indexState[1] == 0) return 1;
			if (Level.indexState[1] == Level.indexState[3] && Level.indexState[1] == turnUser && Level.indexState[2] == 0) return 2;
			//	ГОРИЗОНТАЛЬ  ячейки 4, 5, 6
			if (Level.indexState[4] == Level.indexState[5] && Level.indexState[4] == turnUser && Level.indexState[6] == 0) return 6;
			if (Level.indexState[5] == Level.indexState[6] && Level.indexState[5] == turnUser && Level.indexState[4] == 0) return 4;
			if (Level.indexState[4] == Level.indexState[6] && Level.indexState[4] == turnUser && Level.indexState[5] == 0) return 5;
			//	ГОРИЗОНТАЛЬ  ячейки 7, 8, 9
			if (Level.indexState[7] == Level.indexState[8] && Level.indexState[7] == turnUser && Level.indexState[9] == 0) return 9;
			if (Level.indexState[8] == Level.indexState[9] && Level.indexState[8] == turnUser && Level.indexState[7] == 0) return 7;
			if (Level.indexState[7] == Level.indexState[9] && Level.indexState[7] == turnUser && Level.indexState[8] == 0) return 8;
			//	ВЕРТИКАЛЬ  ячейки 1, 4, 7
			if (Level.indexState[1] == Level.indexState[4] && Level.indexState[1] == turnUser && Level.indexState[7] == 0) return 7;
			if (Level.indexState[4] == Level.indexState[7] && Level.indexState[4] == turnUser && Level.indexState[1] == 0) return 1;
			if (Level.indexState[1] == Level.indexState[7] && Level.indexState[1] == turnUser && Level.indexState[4] == 0) return 4;
			//	ВЕРТИКАЛЬ  ячейки 2, 5, 8
			if (Level.indexState[2] == Level.indexState[5] && Level.indexState[2] == turnUser && Level.indexState[8] == 0) return 8;
			if (Level.indexState[5] == Level.indexState[8] && Level.indexState[5] == turnUser && Level.indexState[2] == 0) return 2;
			if (Level.indexState[2] == Level.indexState[8] && Level.indexState[2] == turnUser && Level.indexState[5] == 0) return 5;
			//	ВЕРТИКАЛЬ  ячейки 3, 6, 9
			if (Level.indexState[3] == Level.indexState[6] && Level.indexState[3] == turnUser && Level.indexState[9] == 0) return 9;
			if (Level.indexState[6] == Level.indexState[9] && Level.indexState[6] == turnUser && Level.indexState[3] == 0) return 3;
			if (Level.indexState[3] == Level.indexState[9] && Level.indexState[3] == turnUser && Level.indexState[6] == 0) return 6;
			//	НАКРЕСТ  ячейки 1, 5, 9
			if (Level.indexState[1] == Level.indexState[5] && Level.indexState[1] == turnUser && Level.indexState[9] == 0) return 9;
			if (Level.indexState[5] == Level.indexState[9] && Level.indexState[5] == turnUser && Level.indexState[1] == 0) return 1;
			if (Level.indexState[1] == Level.indexState[9] && Level.indexState[1] == turnUser && Level.indexState[5] == 0) return 5;
			//	НАКРЕСТ  ячейки 3, 5, 7
			if (Level.indexState[3] == Level.indexState[5] && Level.indexState[3] == turnUser && Level.indexState[7] == 0) return 7;
			if (Level.indexState[5] == Level.indexState[7] && Level.indexState[5] == turnUser && Level.indexState[3] == 0) return 3;
			if (Level.indexState[3] == Level.indexState[7] && Level.indexState[3] == turnUser && Level.indexState[7] == 0) return 5;
			/*----------------------------------------------------------------------*/
		
			return FirstStroke(turnPC, turnUser);
		}
		
		
	}

}