package other
{
	import button.MButton;
	
	import specialLevels.Level1;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;

	//import button1.MButton;

	public class Card extends Sprite
	{
		private var CardBody:Image;
		private var Plant:Vector.<Texture>;
		private var Plants:Image=null;
		private var PlantNumber:Vector.<Texture>;
		private var PlantNumbers:Image=null;
		private var PlantNumbersWS:Image=null;
		private var PlantNumberWithOutSun:Vector.<Texture>;
		private var button1:MButton;
		private var button2:MButton;
		private var num:int;
		public var NumNumber:uint;
		public var CardValue:uint;
		private var ifRefleshwithBegin:Boolean;
		private var refleshDheight:Number=0;
		private var RFImage1:Image,RFImage2:Image;
		private var button3:MButton;
		private var CardPosition:int;
		public function Card(Code:int, Position:int)
		{
			//super(Texture.fromBitmap(new PlantCardBodyCard()),"",null);
			CardPosition=Position;
			num=Code;
			refleshDheight=Refleshfps(num);
			CardBody=new Image(Assets.getTexture("PlantCardBody"));
			addChild(CardBody);
			//Plant = new TextureAtlas(Texture.fromBitmap(new PlantSheet()), XML(new PlantSheetXML())).getTextures("PlantCardSheet");
			Plant = Assets.getTextures("PlantCardSheet","PlantCardSheetXML","PlantCardSheet");
			if(Code != -1)
			Plants = new Image(Plant[Code-1]);
			else
			Plants = new Image(Plant[0]);
			Plants.x=0;
			Plants.y=0;
			addChild(Plants);
			ifRefleshwithBegin=IfRefleshwithBegin(Code);
			PlantNumber = Assets.getTextures("PlantSheetNumber","PlantSheetNumberXML","PlantSheetNumber");
			PlantNumberWithOutSun = Assets.getTextures("PlantSheetNumberWithOutSun","PlantSheetNumberWithOutSunXML","PlantSheetNumberWithOutSun");
			NumNumber=GetPlantNumber(Code);
			CardValue=NumNumber*25;
			PlantNumbers = new Image(PlantNumber[NumNumber]);
			PlantNumbers.x=2.3;
			PlantNumbers.y=71.35;
			addChild(PlantNumbers);
			PlantNumbers.visible=false;
			PlantNumbersWS = new Image(PlantNumberWithOutSun[NumNumber]);
			PlantNumbersWS.x=2.3;
			PlantNumbersWS.y=71.35;
			addChild(PlantNumbersWS);
			button1=new MButton(Assets.getTexture("CardUpState"),new Image(Assets.getTexture("CardDownState")),new Image(Assets.getTexture("CardOnState")),1);
			addChild(button1);
			button2=new MButton(Assets.getTexture("CardNoSunUpState"),new Image(Assets.getTexture("CardNoSunDownState")),new Image(Assets.getTexture("CardNoSunOnState")),-2);
			addChild(button2);
			button2.visible=true;
			RFImage1=new Image(Assets.getTexture("ReFleshBlank1"));
			RFImage2=new Image(Assets.getTexture("ReFleshBlank2"));
			addChild(RFImage1);
			addChild(RFImage2);
			RFImage1.visible=false;
			RFImage2.visible=false;
			button3=new MButton(Assets.getTexture("CardUpState"),new Image(Assets.getTexture("CardReFleshingDownState")),new Image(Assets.getTexture("CardReFleshingOnState")),-1);
			addChild(button3);
			button3.visible=false;
			if(ifRefleshwithBegin)
			{reflesh();}
			if(CardPosition != -2)
			addEventListener(Event.ENTER_FRAME,SunValueJudge);
			else
			{
				button2.visible=false;
				PlantNumbers.visible=true;
				PlantNumbersWS.visible=false;
			}
			Plant=null;
		}
        public function reflesh():void
		{
			if(CardPosition == -2)
				return;
			RFImage1.visible=true;
			RFImage2.visible=true;
			RFImage1.height=101;
			RFImage1.y=0;
			RFImage2.height=1;
			RFImage2.y=100;
			button3.visible=true;
			removeEventListener(Event.ENTER_FRAME,SunValueJudge);
			addEventListener(Event.ENTER_FRAME,Whenreflesh);
		}
		private function Whenreflesh(event:Event):void
		{
			speed = parent.speed;
			var c:uint = 0;
			while(c < speed)
			{
				if(RFImage1.height<=refleshDheight)
				{
					RFImage1.visible=false;
					RFImage2.visible=false;
					button3.visible=false;
					removeEventListener(Event.ENTER_FRAME,Whenreflesh);
					addEventListener(Event.ENTER_FRAME,SunValueJudge);
					return;
				}
				RFImage1.height-=(refleshDheight);
				RFImage2.height+=(refleshDheight);
				RFImage2.y-=(refleshDheight);
				var Target:uint=parent.sunVase.sunEnergy;
				if(Target>=CardValue)
				{
					PlantNumbers.visible=true;
					PlantNumbersWS.visible=false;
				}
				if(Target<CardValue)
				{
					PlantNumbers.visible=false;
					PlantNumbersWS.visible=true;
				}
				c++;
			}
		}
		private function SunValueJudge(event:Event):void
		{
			var Target:uint=parent.sunVase.sunEnergy;
			if(Target>=CardValue&&button2.visible)
			{
				button2.visible=false;
				PlantNumbers.visible=true;
				PlantNumbersWS.visible=false;
				return;
			}
			if(Target<CardValue&&!button2.visible)
			{
				button2.visible=true;
				PlantNumbers.visible=false;
				PlantNumbersWS.visible=true;
			}
		}
		private function GetPlantNumber(C:int):uint
		{
			switch(C)
			{
				case -1:return 4;break;
				case 1:return 4;break;
				case 2:return 2;break;
				case 3:return 2;break;
				case 4:return 1;break;
				default:return 0;
			}
		}
		private function Refleshfps(C:int):Number
		{
			switch(C)
			{
				case -1:return 0.5611;break;
				case 1:return 0.5611;break;
				case 2:return 0.5611;break;
				case 3:return 0.1403;break;
				case 4:return 0.1403;break;
				default:return 0;
			}
		}
		private function IfRefleshwithBegin(C:int):Boolean
		{
			switch(C)
			{
				case -1:
					return false;
				case 2:
					return false;
					break;
				default:
					return true;
			}
		}
		public var Level1_IfSelected:Boolean = false;
		public function sendMessage(Num:int):void
		{
			if(Num == -2 && parent is Level1)
			{
				parent.Tip6();
				return;
			}
			if(Num == -1 && parent is Level1)
			{
				parent.Tip5();
				return;
			}
			Level1_IfSelected = !Level1_IfSelected;
			if(parent is Level1)
				parent.Tip2(Level1_IfSelected);
			var A:Array=new Array;
			A[0]=1;
			A[1]=num;
			A[2]=CardPosition;
			switch(Num)
			{
				case 1:
				{
					if(num == -1)
					{
						A[0]=1;
						A[1]=1;
						A[2]=CardPosition;
						A[3]=true;
					}
					parent.sendMessage(A);
					break;
				}
			}
		}
	}
}