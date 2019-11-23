package button
{
	import plant.Devil_Fern;
	import plant.LotusSeedPodShooter;
	import plant.PeacockFlower;
	import plant.WallNut;
	
	import specialLevels.Level1;
	
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	public class TouchToPlant extends Sprite
	{
		//private var ButtonArray:Array=new Array;
		//private var ButtonImage:Image = new Image(Texture.fromBitmap(new Assets.LineButtonTexture));//new Image;
		private var MouseMoving:Boolean=false;
		private var texLineButton:Texture=Assets.getTexture("LineButtonTexture");
		public function TouchToPlant()
		{
			//for()
			x=150.3;
			y=142;
			var dy:Number=0;
			PutOutTheButton(0,dy);
			PutOutTheButton(74,dy);
			PutOutTheButton(145,dy);
			PutOutTheButton(214,dy);
			PutOutTheButton(287,dy);
			PutOutTheButton(355,dy);
			PutOutTheButton(423,dy);
			PutOutTheButton(494,dy);
			PutOutTheButton(564,dy);
			dy=81;
			PutOutTheButton(0,dy);
			PutOutTheButton(74,dy);
			PutOutTheButton(145,dy);
			PutOutTheButton(214,dy);
			PutOutTheButton(287,dy);
			PutOutTheButton(355,dy);
			PutOutTheButton(423,dy);
			PutOutTheButton(494,dy);
			PutOutTheButton(564,dy);
			dy=167;
			PutOutTheButton(0,dy);
			PutOutTheButton(74,dy);
			PutOutTheButton(145,dy);
			PutOutTheButton(214,dy);
			PutOutTheButton(287,dy);
			PutOutTheButton(355,dy);
			PutOutTheButton(423,dy);
			PutOutTheButton(494,dy);
			PutOutTheButton(564,dy);
			dy=246;
			PutOutTheButton(0,dy);
			PutOutTheButton(74,dy);
			PutOutTheButton(145,dy);
			PutOutTheButton(214,dy);
			PutOutTheButton(287,dy);
			PutOutTheButton(355,dy);
			PutOutTheButton(423,dy);
			PutOutTheButton(494,dy);
			PutOutTheButton(564,dy);
			dy=332;
			PutOutTheButton(0,dy);
			PutOutTheButton(74,dy);
			PutOutTheButton(145,dy);
			PutOutTheButton(214,dy);
			PutOutTheButton(287,dy);
			PutOutTheButton(355,dy);
			PutOutTheButton(423,dy);
			PutOutTheButton(494,dy);
			PutOutTheButton(564,dy);
			this.addEventListener(TouchEvent.TOUCH,onTouch);
		}
		private function PutOutTheButton(dx:Number,dy:Number):void
		{
			//ButtonArray[num]
			var Target:Image=new Image(texLineButton);
			Target.x=dx;
			Target.y=dy;
			addChild(Target);
			//ButtonArray[num].x=dx;
			//ButtonArray[num].y=dy;
			//addChild(ButtonArray[num]);
		}
		public function onTouch(eventObject:TouchEvent):void
		{
			var touch:Touch=eventObject.getTouch(this);
			if(touch)
			{
				switch(touch.phase)
				{
					case TouchPhase.BEGAN:
					{/*trace("TouchToPlant mouse begin.");*/break;}
					case TouchPhase.HOVER:
					{/*trace("TouchToPlant mouse in...");*/break;}
					case TouchPhase.ENDED:
						onClick();break;
					case TouchPhase.MOVED:
					{/*trace("TouchToPlant mouse moving.");*/break;}
					case TouchPhase.STATIONARY:
						/*trace("TouchToPlant mouse stationed.");*/break;
					default:
						/*trace("unknown event.");*/break;
				}
			}
			else
			{
				//trace("TouchToPlant mouse out...");
			}
		}
		public function DGP(line:uint,number:uint,variety:uint):DisplayObject
		{
			switch(variety)
			{
				//case 1:{Line[line].Plants[number]=new LevelPlant_LotusSeedPodShooterFlash;break;}
				case 1:{parent.arrLine[line].Plants[number]=new LotusSeedPodShooter;break;}
				case 2:{parent.arrLine[line].Plants[number]=new PeacockFlower;break;}
				case 3:{parent.arrLine[line].Plants[number]=new WallNut;break;}
				case 4:{parent.arrLine[line].Plants[number]=new Devil_Fern;break;}
				//case 3:{Line[line].Plants[number]=new LevelPlant_WallnutFlash;break;}
				//case 4:{Line[line].Plants[number]=new LevelPlant_DevilFernFlash;break;}
			}
		}
		public function DPP(line:uint,number:uint,dx:Number,dy:Number):void
		{
			parent.arrLine[line].Plants[number].x=dx;
			parent.arrLine[line].Plants[number].y=dy;
		}
		public function MSN(code:uint):void
		{
			switch(code)
			{
				case 1:{parent.sunVase.TakeEnergy(-(parent.CardSeat1.CardValue));return;}
				case 2:{parent.sunVase.TakeEnergy(-(parent.CardSeat2.CardValue));return;}
				case 3:{parent.sunVase.TakeEnergy(-(parent.CardSeat3.CardValue));return;}
				case 4:{parent.sunVase.TakeEnergy(-(parent.CardSeat4.CardValue));return;}
				case 5:{parent.sunVase.TakeEnergy(-(parent.CardSeat5.CardValue));return;}
				case 6:{parent.sunVase.TakeEnergy(-(parent.CardSeat6.CardValue));return;}
				case 7:{parent.sunVase.TakeEnergy(-(parent.CardSeat7.CardValue));return;}
				case 8:{parent.sunVase.TakeEnergy(-(parent.CardSeat8.CardValue));return;}
				case 9:{parent.sunVase.TakeEnergy(-(parent.CardSeat9.CardValue));return;}
			}
		}
		public function CRA(code:uint):void
		{
			if(parent is Level1)
			{parent.Level1_CardSeat.reflesh();return;}
			switch(code)
			{
				case 1:{parent.CardSeat1.reflesh();break;}
				case 2:{parent.CardSeat2.reflesh();break;}
				case 3:{parent.CardSeat3.reflesh();break;}
				case 4:{parent.CardSeat4.reflesh();break;}
				case 5:{parent.CardSeat5.reflesh();break;}
				case 6:{parent.CardSeat6.reflesh();break;}
				case 7:{parent.CardSeat7.reflesh();break;}
				case 8:{parent.CardSeat8.reflesh();break;}
				case 9:{parent.CardSeat9.reflesh();break;}
			}
		}
		private function MisofPutPX(T:uint):Number
		{
			switch(T)
			{
				case 1:return -149;
				case 2:return -125.1;
				case 3:return -112;
				case 4:return -120;
			}
			return 0;
		}
		private function MisofPutPY(T:uint):Number
		{
			switch(T)
			{
				case 1:return -48;
				case 2:return -44;
				case 3:return -20;
				case 4:return -22;
			}
			return 0;
		}
		private function onClick():void
		{
			if (parent.imgMousePhasePlant1 == null)
			{
				return;
			}
            //var A:Array=new Array;
			//A[0]=2;
			
			/*trace("OnClicked TTP...");*/
			
			var xx:Number=parent.parent.MouseX;
			var yy:Number=parent.parent.MouseY;
			if(yy>=141.3&&yy<=177)
			{
				if(parent.arrLine[0]==null){return;}
				if(xx>=150.3&&xx<=186.6){if(parent.arrLine[0].Plants[0]!=null){return;}DGP(0,0,parent.iPlantNum);DPP(0,0,MisofPutPX(parent.iPlantNum)+250.1,MisofPutPY(parent.iPlantNum)+139.9);parent.arrLine[0].Plant(0);MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=224.3&&xx<=260.6){if(parent.arrLine[0].Plants[1]!=null){return;}DGP(0,1,parent.iPlantNum);DPP(0,1,MisofPutPX(parent.iPlantNum)+320.1,MisofPutPY(parent.iPlantNum)+139.9);parent.arrLine[0].Plant(1);/*Line[0].Plants[1].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=295.3&&xx<=331.6){if(parent.arrLine[0].Plants[2]!=null){return;}DGP(0,2,parent.iPlantNum);DPP(0,2,MisofPutPX(parent.iPlantNum)+391.1,MisofPutPY(parent.iPlantNum)+139.9);parent.arrLine[0].Plant(2);/*Line[0].Plants[2].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=364.3&&xx<=401.6){if(parent.arrLine[0].Plants[3]!=null){return;}DGP(0,3,parent.iPlantNum);DPP(0,3,MisofPutPX(parent.iPlantNum)+461.1,MisofPutPY(parent.iPlantNum)+139.9);parent.arrLine[0].Plant(3);/*Line[0].Plants[3].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=437.3&&xx<=473.6){if(parent.arrLine[0].Plants[4]!=null){return;}DGP(0,4,parent.iPlantNum);DPP(0,4,MisofPutPX(parent.iPlantNum)+533.1,MisofPutPY(parent.iPlantNum)+139.9);parent.arrLine[0].Plant(4);/*Line[0].Plants[4].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=505.3&&xx<=541.6){if(parent.arrLine[0].Plants[5]!=null){return;}DGP(0,5,parent.iPlantNum);DPP(0,5,MisofPutPX(parent.iPlantNum)+610.1,MisofPutPY(parent.iPlantNum)+139.9);parent.arrLine[0].Plant(5);/*Line[0].Plants[5].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=573.3&&xx<=610.6){if(parent.arrLine[0].Plants[6]!=null){return;}DGP(0,6,parent.iPlantNum);DPP(0,6,MisofPutPX(parent.iPlantNum)+670.1,MisofPutPY(parent.iPlantNum)+139.9);parent.arrLine[0].Plant(6);/*Line[0].Plants[6].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=644.3&&xx<=681.6){if(parent.arrLine[0].Plants[7]!=null){return;}DGP(0,7,parent.iPlantNum);DPP(0,7,MisofPutPX(parent.iPlantNum)+740.1,MisofPutPY(parent.iPlantNum)+139.9);parent.arrLine[0].Plant(7);/*Line[0].Plants[7].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=714.3&&xx<=750.6){if(parent.arrLine[0].Plants[8]!=null){return;}DGP(0,8,parent.iPlantNum);DPP(0,8,MisofPutPX(parent.iPlantNum)+810.1,MisofPutPY(parent.iPlantNum)+139.9);parent.arrLine[0].Plant(8);/*Line[0].Plants[8].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else return;
			}
			else if(yy>=222.3&&yy<=258.3)
			{
				if(parent.arrLine[1]==null){return;}
				if(xx>=150.3&&xx<=186.6){if(parent.arrLine[1].Plants[0]!=null){return;}DGP(1,0,parent.iPlantNum);DPP(1,0,MisofPutPX(parent.iPlantNum)+250.1,MisofPutPY(parent.iPlantNum)+221.9);parent.arrLine[1].Plant(0);/*Line[1].Plants[0].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=224.3&&xx<=260.6){if(parent.arrLine[1].Plants[1]!=null){return;}DGP(1,1,parent.iPlantNum);DPP(1,1,MisofPutPX(parent.iPlantNum)+320.1,MisofPutPY(parent.iPlantNum)+221.9);parent.arrLine[1].Plant(1);/*Line[1].Plants[1].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=295.3&&xx<=331.6){if(parent.arrLine[1].Plants[2]!=null){return;}DGP(1,2,parent.iPlantNum);DPP(1,2,MisofPutPX(parent.iPlantNum)+391.1,MisofPutPY(parent.iPlantNum)+221.9);parent.arrLine[1].Plant(2);/*Line[1].Plants[2].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=364.3&&xx<=401.6){if(parent.arrLine[1].Plants[3]!=null){return;}DGP(1,3,parent.iPlantNum);DPP(1,3,MisofPutPX(parent.iPlantNum)+461.1,MisofPutPY(parent.iPlantNum)+221.9);parent.arrLine[1].Plant(3);/*Line[1].Plants[3].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=437.3&&xx<=473.6){if(parent.arrLine[1].Plants[4]!=null){return;}DGP(1,4,parent.iPlantNum);DPP(1,4,MisofPutPX(parent.iPlantNum)+533.1,MisofPutPY(parent.iPlantNum)+221.9);parent.arrLine[1].Plant(4);/*Line[1].Plants[4].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=505.3&&xx<=541.6){if(parent.arrLine[1].Plants[5]!=null){return;}DGP(1,5,parent.iPlantNum);DPP(1,5,MisofPutPX(parent.iPlantNum)+610.1,MisofPutPY(parent.iPlantNum)+221.9);parent.arrLine[1].Plant(5);/*Line[1].Plants[5].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=573.3&&xx<=610.6){if(parent.arrLine[1].Plants[6]!=null){return;}DGP(1,6,parent.iPlantNum);DPP(1,6,MisofPutPX(parent.iPlantNum)+670.1,MisofPutPY(parent.iPlantNum)+221.9);parent.arrLine[1].Plant(6);/*Line[1].Plants[6].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=644.3&&xx<=681.6){if(parent.arrLine[1].Plants[7]!=null){return;}DGP(1,7,parent.iPlantNum);DPP(1,7,MisofPutPX(parent.iPlantNum)+740.1,MisofPutPY(parent.iPlantNum)+221.9);parent.arrLine[1].Plant(7);/*Line[1].Plants[7].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=714.3&&xx<=750.6){if(parent.arrLine[1].Plants[8]!=null){return;}DGP(1,8,parent.iPlantNum);DPP(1,8,MisofPutPX(parent.iPlantNum)+810.1,MisofPutPY(parent.iPlantNum)+221.9);parent.arrLine[1].Plant(8);/*Line[1].Plants[8].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else return;
			}
			else if(yy>=308.3&&yy<=351.2)
			{
				if(parent.arrLine[2]==null){return;}
				if(xx>=150.3&&xx<=186.6){if(parent.arrLine[2].Plants[0]!=null){return;}DGP(2,0,parent.iPlantNum);DPP(2,0,MisofPutPX(parent.iPlantNum)+250.1,MisofPutPY(parent.iPlantNum)+303.2);parent.arrLine[2].Plant(0);/*Line[2].Plants[0].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);if(parent is Level1){parent.Tip3();}var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=224.3&&xx<=260.6){if(parent.arrLine[2].Plants[1]!=null){return;}DGP(2,1,parent.iPlantNum);DPP(2,1,MisofPutPX(parent.iPlantNum)+320.1,MisofPutPY(parent.iPlantNum)+303.2);parent.arrLine[2].Plant(1);/*Line[2].Plants[1].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);if(parent is Level1){parent.Tip3();}var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=295.3&&xx<=331.6){if(parent.arrLine[2].Plants[2]!=null){return;}DGP(2,2,parent.iPlantNum);DPP(2,2,MisofPutPX(parent.iPlantNum)+391.1,MisofPutPY(parent.iPlantNum)+303.2);parent.arrLine[2].Plant(2);/*Line[2].Plants[2].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);if(parent is Level1){parent.Tip3();}var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=364.3&&xx<=401.6){if(parent.arrLine[2].Plants[3]!=null){return;}DGP(2,3,parent.iPlantNum);DPP(2,3,MisofPutPX(parent.iPlantNum)+461.1,MisofPutPY(parent.iPlantNum)+303.2);parent.arrLine[2].Plant(3);/*Line[2].Plants[3].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);if(parent is Level1){parent.Tip3();}var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=437.3&&xx<=473.6){if(parent.arrLine[2].Plants[4]!=null){return;}DGP(2,4,parent.iPlantNum);DPP(2,4,MisofPutPX(parent.iPlantNum)+533.1,MisofPutPY(parent.iPlantNum)+303.2);parent.arrLine[2].Plant(4);/*Line[2].Plants[4].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);if(parent is Level1){parent.Tip3();}var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=505.3&&xx<=541.6){if(parent.arrLine[2].Plants[5]!=null){return;}DGP(2,5,parent.iPlantNum);DPP(2,5,MisofPutPX(parent.iPlantNum)+610.1,MisofPutPY(parent.iPlantNum)+303.2);parent.arrLine[2].Plant(5);/*Line[2].Plants[5].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);if(parent is Level1){parent.Tip3();}var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=573.3&&xx<=610.6){if(parent.arrLine[2].Plants[6]!=null){return;}DGP(2,6,parent.iPlantNum);DPP(2,6,MisofPutPX(parent.iPlantNum)+670.1,MisofPutPY(parent.iPlantNum)+303.2);parent.arrLine[2].Plant(6);/*Line[2].Plants[6].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);if(parent is Level1){parent.Tip3();}var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=644.3&&xx<=681.6){if(parent.arrLine[2].Plants[7]!=null){return;}DGP(2,7,parent.iPlantNum);DPP(2,7,MisofPutPX(parent.iPlantNum)+740.1,MisofPutPY(parent.iPlantNum)+303.2);parent.arrLine[2].Plant(7);/*Line[2].Plants[7].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);if(parent is Level1){parent.Tip3();}var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=714.3&&xx<=750.6){if(parent.arrLine[2].Plants[8]!=null){return;}DGP(2,8,parent.iPlantNum);DPP(2,8,MisofPutPX(parent.iPlantNum)+810.1,MisofPutPY(parent.iPlantNum)+303.2);parent.arrLine[2].Plant(8);/*Line[2].Plants[8].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);if(parent is Level1){parent.Tip3();}var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else return;
			}
			else if(yy>=387.3&&yy<=423.2)
			{
				if(parent.arrLine[3]==null){return;}
				if(xx>=150.3&&xx<=186.6){if(parent.arrLine[3].Plants[0]!=null){return;}DGP(3,0,parent.iPlantNum);DPP(3,0,MisofPutPX(parent.iPlantNum)+250.1,MisofPutPY(parent.iPlantNum)+386.9);parent.arrLine[3].Plant(0);/*Line[3].Plants[0].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=224.3&&xx<=260.6){if(parent.arrLine[3].Plants[1]!=null){return;}DGP(3,1,parent.iPlantNum);DPP(3,1,MisofPutPX(parent.iPlantNum)+320.1,MisofPutPY(parent.iPlantNum)+386.9);parent.arrLine[3].Plant(1);/*Line[3].Plants[1].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=295.3&&xx<=331.6){if(parent.arrLine[3].Plants[2]!=null){return;}DGP(3,2,parent.iPlantNum);DPP(3,2,MisofPutPX(parent.iPlantNum)+391.1,MisofPutPY(parent.iPlantNum)+386.9);parent.arrLine[3].Plant(2);/*Line[3].Plants[2].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=364.3&&xx<=401.6){if(parent.arrLine[3].Plants[3]!=null){return;}DGP(3,3,parent.iPlantNum);DPP(3,3,MisofPutPX(parent.iPlantNum)+461.1,MisofPutPY(parent.iPlantNum)+386.9);parent.arrLine[3].Plant(3);/*Line[3].Plants[3].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=437.3&&xx<=473.6){if(parent.arrLine[3].Plants[4]!=null){return;}DGP(3,4,parent.iPlantNum);DPP(3,4,MisofPutPX(parent.iPlantNum)+533.1,MisofPutPY(parent.iPlantNum)+386.9);parent.arrLine[3].Plant(4);/*Line[3].Plants[4].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=505.3&&xx<=541.6){if(parent.arrLine[3].Plants[5]!=null){return;}DGP(3,5,parent.iPlantNum);DPP(3,5,MisofPutPX(parent.iPlantNum)+610.1,MisofPutPY(parent.iPlantNum)+386.9);parent.arrLine[3].Plant(5);/*Line[3].Plants[5].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=573.3&&xx<=610.6){if(parent.arrLine[3].Plants[6]!=null){return;}DGP(3,6,parent.iPlantNum);DPP(3,6,MisofPutPX(parent.iPlantNum)+670.1,MisofPutPY(parent.iPlantNum)+386.9);parent.arrLine[3].Plant(6);/*Line[3].Plants[6].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=644.3&&xx<=681.6){if(parent.arrLine[3].Plants[7]!=null){return;}DGP(3,7,parent.iPlantNum);DPP(3,7,MisofPutPX(parent.iPlantNum)+740.1,MisofPutPY(parent.iPlantNum)+386.9);parent.arrLine[3].Plant(7);/*Line[3].Plants[7].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=714.3&&xx<=750.6){if(parent.arrLine[3].Plants[8]!=null){return;}DGP(3,8,parent.iPlantNum);DPP(3,8,MisofPutPX(parent.iPlantNum)+810.1,MisofPutPY(parent.iPlantNum)+386.9);parent.arrLine[3].Plant(8);/*Line[3].Plants[8].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else return;
			}
			else if(yy>=468.3&&yy<=504.2)
			{
				if(parent.arrLine[4]==null){return;}
				if(xx>=150.3&&xx<=186.6){if(parent.arrLine[4].Plants[0]!=null){return;}DGP(4,0,parent.iPlantNum);DPP(4,0,MisofPutPX(parent.iPlantNum)+250.1,MisofPutPY(parent.iPlantNum)+470.8);parent.arrLine[4].Plant(0);/*Line[4].Plants[0].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=224.3&&xx<=260.6){if(parent.arrLine[4].Plants[1]!=null){return;}DGP(4,1,parent.iPlantNum);DPP(4,1,MisofPutPX(parent.iPlantNum)+320.1,MisofPutPY(parent.iPlantNum)+470.8);parent.arrLine[4].Plant(1);/*Line[4].Plants[1].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=295.3&&xx<=331.6){if(parent.arrLine[4].Plants[2]!=null){return;}DGP(4,2,parent.iPlantNum);DPP(4,2,MisofPutPX(parent.iPlantNum)+391.1,MisofPutPY(parent.iPlantNum)+470.8);parent.arrLine[4].Plant(2);/*Line[4].Plants[2].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=364.3&&xx<=401.6){if(parent.arrLine[4].Plants[3]!=null){return;}DGP(4,3,parent.iPlantNum);DPP(4,3,MisofPutPX(parent.iPlantNum)+461.1,MisofPutPY(parent.iPlantNum)+470.8);parent.arrLine[4].Plant(3);/*Line[4].Plants[3].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=437.3&&xx<=473.6){if(parent.arrLine[4].Plants[4]!=null){return;}DGP(4,4,parent.iPlantNum);DPP(4,4,MisofPutPX(parent.iPlantNum)+533.1,MisofPutPY(parent.iPlantNum)+470.8);parent.arrLine[4].Plant(4);/*Line[4].Plants[4].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=505.3&&xx<=541.6){if(parent.arrLine[4].Plants[5]!=null){return;}DGP(4,5,parent.iPlantNum);DPP(4,5,MisofPutPX(parent.iPlantNum)+610.1,MisofPutPY(parent.iPlantNum)+470.8);parent.arrLine[4].Plant(5);/*Line[4].Plants[5].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=573.3&&xx<=610.6){if(parent.arrLine[4].Plants[6]!=null){return;}DGP(4,6,parent.iPlantNum);DPP(4,6,MisofPutPX(parent.iPlantNum)+670.1,MisofPutPY(parent.iPlantNum)+470.8);parent.arrLine[4].Plant(6);/*Line[4].Plants[6].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=644.3&&xx<=681.6){if(parent.arrLine[4].Plants[7]!=null){return;}DGP(4,7,parent.iPlantNum);DPP(4,7,MisofPutPX(parent.iPlantNum)+740.1,MisofPutPY(parent.iPlantNum)+470.8);parent.arrLine[4].Plant(7);/*Line[4].Plants[7].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else if(xx>=714.3&&xx<=750.6){if(parent.arrLine[4].Plants[8]!=null){return;}DGP(4,8,parent.iPlantNum);DPP(4,8,MisofPutPX(parent.iPlantNum)+810.1,MisofPutPY(parent.iPlantNum)+470.8);parent.arrLine[4].Plant(8);/*Line[4].Plants[8].CardSit=CardNum+1;*/MSN(parent.uiCardNumberNow);CRA(parent.uiCardNumberNow);var A:Array=new Array;A[0]=1;A[1]=parent.iPlantNum;parent.sendMessage(A);return;}
				else return;
			}
			
			
			
				//parent.sendMessage(Num);
			/*trace("TouchToPlant mouse ended.");*/
		}
	}
}