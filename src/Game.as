package
{
	
	import flash.geom.Point;
	import flash.net.SharedObject;
	
	import other.Level;
	
	import specialLevels.Level1;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	
	public class Game extends Sprite
	{/*
		private var mMovie:Array=new Array;
		public var uiLevel:uint=0;
		
		private var i:int=0;
		
		public var MouseX:int,MouseY:int;
		*/
		public var Test:SharedObject = SharedObject.getLocal("CDHL");
		public function Game()
		{
		    //Test.clear();
			//Test.data.PlayLevel = 1;
			//Test.flush();
			
			trace(String(Test.data.PlayLevel));
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			addEventListener(TouchEvent.TOUCH, GetMouseXY);
		}
		private function AddLevelFive():void
		{
			var levelArray:Array=new Array;
			
			for(uiLevel = 0; uiLevel < 11; uiLevel++ )
				levelArray[uiLevel]=1;
			
			while(1)
			{
				i=Math.ceil(Math.random()*100)%11;
				if(levelArray[i]!=2)
				{
					levelArray[i]=2;
					break;
				}
			}
			while(1)
			{
				i=Math.ceil(Math.random()*100)%11;
				if(levelArray[i]!=2)
				{
					levelArray[i]=2;
					break;
				}
			}
			while(1)
			{
				i=Math.ceil(Math.random()*100)%11;
				if(levelArray[i]!=2)
				{
					levelArray[i]=2;
					break;
				}
			}
			while(1)
			{
				i=Math.ceil(Math.random()*100)%11;
				if(levelArray[i]!=2)
				{
					levelArray[i]=4;
					break;
				}
			}
			var levelArray2:Array=new Array;
			
			levelArray2[0]=11;
			levelArray2[1]=true;
			levelArray2[2]=true;
			levelArray2[3]=false;
			levelArray2[4]=4;
			levelArray2[5]=50;
			levelArray2[6]=true;
			levelArray2[7]=31;
			levelArray2[8]=1;
			levelArray2[9]=false;
			levelArray2[10]=true;
			
			var levelArray3:Array=new Array;
			
			levelArray3[0]=1;
			levelArray3[1]=2;
			levelArray3[2]=3;
			levelArray3[3]=4;
			
			var levelArray4:Array=new Array;
			levelArray4[0]="Begin:";
			levelArray4[1]=480;
			levelArray4[2]=1;
			levelArray4[3]="AddProgressBar:";
			levelArray4[4]="SetFlagMassage:";
			levelArray4[5]=118;
			levelArray4[6]=42;
			levelArray4[7]="Begin:";
			levelArray4[8]=420;
			levelArray4[9]=1;
			levelArray4[10]=820;
			levelArray4[11]=1;
			levelArray4[12]=1220;
			levelArray4[13]=1;
			levelArray4[14]=1620;
			levelArray4[15]=1;
			levelArray4[16]="Continue:";
			levelArray4[17]=150;
			levelArray4[18]=1;
			levelArray4[19]=2;
			levelArray4[20]=1;
			levelArray4[21]=1;
			levelArray4[22]=1;
			levelArray4[23]=1;
			levelArray4[24]=1;
			levelArray4[25]=2;
			levelArray4[26]=2;
			levelArray4[27]=2;
			levelArray4[28]=1;
			levelArray4[29]=4;
			levelArray4[30]=1;
			levelArray4[31]=1;
			levelArray4[32]=1;
			levelArray4[33]=1;
			levelArray4[34]=1;
			levelArray4[35]=2;
			levelArray4[36]=2;
			levelArray4[37]=2;
			levelArray4[38]="Continue:";
			levelArray4[39]=50;
			levelArray4[40]=2;
			levelArray4[41]=2;
			levelArray4[42]=1;
			levelArray4[43]=1;
			levelArray4[44]=1;
			levelArray4[45]=2;
			levelArray4[46]=1;
			levelArray4[47]=2;
			levelArray4[48]=2;
			levelArray4[49]=2;
			levelArray4[50]=1;
			levelArray4[51]=2;
			levelArray4[52]=1;
			levelArray4[53]=1;
			levelArray4[54]=2;
			levelArray4[55]=1;
			levelArray4[56]="ProducedAllZombiesFromFlag:";
			levelArray4[57]="Begin:";
			levelArray4[58]=1200;
			levelArray4[59]=0;
			levelArray4[60]="Flag:";
			levelArray4[61]="FinalFlag:";
			levelArray4[62]="SetFlagMassage:";
			levelArray4[63]=0;
			levelArray4[64]=0;
			levelArray4[65]="RaiseFlags:";
			levelArray4[66]=0;
			levelArray4[67]="Begin:";
			levelArray4[68]=200;
			levelArray4[69]=3;
			levelArray4[70]="Continue:";
			levelArray4[71]=25;
			levelArray4[72]=1;
			levelArray4[73]=2;
			levelArray4[74]=1;
			levelArray4[75]=1;
			levelArray4[76]=2;
			levelArray4[77]=1;
			levelArray4[78]=1;
			levelArray4[79]=2;
			levelArray4[80]=1;
			levelArray4[81]=2;
			levelArray4[82]=2;
			levelArray4[83]=2;
			levelArray4[84]=2;
			levelArray4[85]=2;
			levelArray4[86]=4;
			levelArray4[87]="EndProducing:";
			LevelNow = new Level(levelArray,"DreamBackGround",levelArray2,levelArray3,levelArray4);
		}
		private function AddLevelTwo():void
		{
			var levelArray:Array=new Array;
			
			for(uiLevel = 0; uiLevel < 10; uiLevel++ )
				levelArray[uiLevel]=1;
			
			var levelArray2:Array=new Array;
			
			levelArray2[0]=9;
			levelArray2[1]=false;
			levelArray2[2]=false;
			levelArray2[3]=false;
			levelArray2[4]=2;
			levelArray2[5]=50;
			levelArray2[6]=true;
			levelArray2[7]=14;
			levelArray2[8]=1;
			levelArray2[9]=false;
			levelArray2[10]=false;
			levelArray2[11]="C";
			levelArray2[12]=3;
			levelArray2[13]="DreamLevel2";
			
			var levelArray3:Array=new Array;
			
			levelArray3[0]=1;
			levelArray3[1]=2;
			
			var levelArray4:Array=new Array;
			//levelArray4[0]="Level2_Tip:";
			levelArray4[0]="Begin:";
			levelArray4[1]=1200;
			levelArray4[2]=1;
			levelArray4[3]="AddProgressBar:";
			levelArray4[4]="SetFlagMassage:";
			levelArray4[5]=118;
			levelArray4[6]=10;
			levelArray4[7]="Begin:";
			levelArray4[8]=400;
			levelArray4[9]=1;
			levelArray4[10]=800;
			levelArray4[11]=1;
			levelArray4[12]="Continue:";
			levelArray4[13]=65;
			levelArray4[14]=1;
			levelArray4[15]=1;
			levelArray4[16]=1;
			levelArray4[17]=1;
			levelArray4[18]=1;
			levelArray4[19]=1;
			levelArray4[20]=1;
			levelArray4[21]="ProducedAllZombiesFromFlag:";
			levelArray4[22]="Begin:";
			levelArray4[23]=960;
			levelArray4[24]=0;
			levelArray4[25]="Flag:";
			levelArray4[26]="FinalFlag:";
			levelArray4[27]="SetFlagMassage:";
			levelArray4[28]=0;
			levelArray4[29]=0;
			levelArray4[30]="RaiseFlags:";
			levelArray4[31]=0;
			levelArray4[32]="Begin:";
			levelArray4[33]=200;
			levelArray4[34]=3;
			levelArray4[35]="Continue:";
			levelArray4[36]=25;
			levelArray4[37]=1;
			levelArray4[38]=1;
			levelArray4[39]=1;
			levelArray4[40]=1;
			levelArray4[41]=1;
			levelArray4[42]=1;
			levelArray4[43]="EndProducing:";
			
			
			LevelNow = new Level(levelArray,"DreamBackGround",levelArray2,levelArray3,levelArray4);
		}
		private function AddLevelFour():void
		{
			var levelArray:Array=new Array;
			
			for(uiLevel = 0; uiLevel < 9; uiLevel++ )
				levelArray[uiLevel]=1;
			
			while(1)
			{
				i=Math.ceil(Math.random()*100)%9;
				if(levelArray[i]!=2)
				{
					levelArray[i]=2;
					break;
				}
			}
			while(1)
			{
				i=Math.ceil(Math.random()*100)%9;
				if(levelArray[i]!=2)
				{
					levelArray[i]=2;
					break;
				}
			}
			var levelArray2:Array=new Array;
			
			levelArray2[0]=9;
			levelArray2[1]=true;
			levelArray2[2]=true;
			levelArray2[3]=false;
			levelArray2[4]=4;
			levelArray2[5]=50;
			levelArray2[6]=true;
			levelArray2[7]=31;
			levelArray2[8]=1;
			levelArray2[9]=false;
			levelArray2[10]=false;
			levelArray2[11]="T";
			levelArray2[12]=Assets.getTexture("Shovel");
			levelArray2[13]="DreamLevel4";
			
			var levelArray3:Array=new Array;
			
			levelArray3[0]=1;
			levelArray3[1]=2;
			levelArray3[2]=3;
			levelArray3[3]=4;
			
			var levelArray4:Array=new Array;
			levelArray4[0]="Begin:";
			levelArray4[1]=480;
			levelArray4[2]=1;
			levelArray4[3]="AddProgressBar:";
			levelArray4[4]="SetFlagMassage:";
			levelArray4[5]=118;
			levelArray4[6]=25;
			levelArray4[7]="Begin:";
			levelArray4[8]=420;
			levelArray4[9]=1;
			levelArray4[10]=820;
			levelArray4[11]=1;
			levelArray4[12]=1220;
			levelArray4[13]=1;
			levelArray4[14]=1620;
			levelArray4[15]=1;
			levelArray4[16]="Continue:";
			levelArray4[17]=150;
			levelArray4[18]=1;
			levelArray4[19]=2;
			levelArray4[20]=1;
			levelArray4[21]=1;
			levelArray4[22]=1;
			levelArray4[23]=1;
			levelArray4[24]=1;
			levelArray4[25]=2;
			levelArray4[26]=2;
			levelArray4[27]=2;
			levelArray4[28]=1;
			levelArray4[29]=2;
			levelArray4[30]=1;
			levelArray4[31]=1;
			levelArray4[32]=1;
			levelArray4[33]=1;
			levelArray4[34]=1;
			levelArray4[35]=2;
			levelArray4[36]=2;
			levelArray4[37]=2;
			levelArray4[38]="ProducedAllZombiesFromFlag:";
			levelArray4[39]="Begin:";
			levelArray4[40]=1200;
			levelArray4[41]=0;
			levelArray4[42]="Flag:";
			levelArray4[43]="FinalFlag:";
			levelArray4[44]="SetFlagMassage:";
			levelArray4[45]=0;
			levelArray4[46]=0;
			levelArray4[47]="RaiseFlags:";
			levelArray4[48]=0;
			levelArray4[49]="Begin:";
			levelArray4[50]=200;
			levelArray4[51]=3;
			levelArray4[52]="Continue:";
			levelArray4[53]=25;
			levelArray4[54]=1;
			levelArray4[55]=2;
			levelArray4[56]=1;
			levelArray4[57]=1;
			levelArray4[58]=2;
			levelArray4[59]=1;
			levelArray4[60]=1;
			levelArray4[61]=2;
			levelArray4[62]=1;
			levelArray4[63]=2;
			levelArray4[64]=2;
			levelArray4[65]=2;
			levelArray4[66]="EndProducing:";
			LevelNow = new Level(levelArray,"DreamBackGround",levelArray2,levelArray3,levelArray4);
		}
		public function NextLevel(Code:String):void
		{
			removeChild(LevelNow);
			LevelNow.dispose();
			if(Code == "DreamLevel1"){Test.data.PlayLevel = 2;Test.flush();;AddLevelTwo();}
			if(Code == "DreamLevel2"){Test.data.PlayLevel = 3;Test.flush();AddLevelThree();}
			if(Code == "DreamLevel3"){Test.data.PlayLevel = 4;Test.flush();AddLevelFour();}
			if(Code == "DreamLevel4"){Test.data.PlayLevel = 5;Test.flush();AddLevelFive();}
			addChild(LevelNow);
		}
		public var LevelNow:Level;
		private function AddLevelThree():void
		{
			var levelArray:Array=new Array;
			
			for(uiLevel = 0; uiLevel < 9; uiLevel++ )
				levelArray[uiLevel]=1;
			
			while(1)
			{
				i=Math.ceil(Math.random()*100)%9;
				if(levelArray[i]!=2)
				{
					levelArray[i]=2;
					break;
				}
			}
			var levelArray2:Array=new Array;
			
			levelArray2[0]=9;
			levelArray2[1]=false;
			levelArray2[2]=false;
			levelArray2[3]=false;
			levelArray2[4]=3;
			levelArray2[5]=50;
			levelArray2[6]=true;
			levelArray2[7]=14;
			levelArray2[8]=1;
			levelArray2[9]=false;
			levelArray2[10]=false;
			levelArray2[11]="C";
			levelArray2[12]=4;
			levelArray2[13]="DreamLevel3";
			
			var levelArray3:Array=new Array;
			
			levelArray3[0]=1;
			levelArray3[1]=2;
			levelArray3[2]=3;
			
			var levelArray4:Array=new Array;
			levelArray4[0]="Begin:";
			levelArray4[1]=480;
			levelArray4[2]=1;
			levelArray4[3]="AddProgressBar:";
			levelArray4[4]="SetFlagMassage:";
			levelArray4[5]=118;
			levelArray4[6]=17;
			levelArray4[7]="Begin:";
			levelArray4[8]=480;
			levelArray4[9]=1;
			levelArray4[10]=960;
			levelArray4[11]=1;
			levelArray4[12]=1440;
			levelArray4[13]=1;
			levelArray4[14]=1920;
			levelArray4[15]=1;
			levelArray4[16]="Continue:";
			levelArray4[17]=120;
			levelArray4[18]=1;
			levelArray4[19]=2;
			levelArray4[20]=1;
			levelArray4[21]=1;
			levelArray4[22]=2;
			levelArray4[23]=1;
			levelArray4[24]=2;
			levelArray4[25]=1;
			levelArray4[26]=1;
			levelArray4[27]=1;
			levelArray4[28]=2;
			levelArray4[29]=2;
			levelArray4[30]="ProducedAllZombiesFromFlag:";
			levelArray4[31]="Begin:";
			levelArray4[32]=960;
			levelArray4[33]=0;
			levelArray4[34]="Flag:";
			levelArray4[35]="FinalFlag:";
			levelArray4[36]="SetFlagMassage:";
			levelArray4[37]=0;
			levelArray4[38]=0;
			levelArray4[39]="RaiseFlags:";
			levelArray4[40]=0;
			levelArray4[41]="Begin:";
			levelArray4[42]=200;
			levelArray4[43]=3;
			levelArray4[44]="Continue:";
			levelArray4[45]=25;
			levelArray4[46]=1;
			levelArray4[47]=2;
			levelArray4[48]=1;
			levelArray4[49]=1;
			levelArray4[50]=2;
			levelArray4[51]=1;
			levelArray4[52]="EndProducing:";
			
			
			LevelNow = new Level(levelArray,"DreamBackGround",levelArray2,levelArray3,levelArray4);
		}
		private function AddLevelOne():void
		{
			var levelArray:Array=new Array;
			
			for(uiLevel = 0; uiLevel < 5; uiLevel++ )
				levelArray[uiLevel]=1;
			var levelArray2:Array=new Array;
			
			levelArray2[0]=5;
			levelArray2[1]=false;
			levelArray2[2]=false;
			levelArray2[3]=false;
			levelArray2[4]=1;
			levelArray2[5]=100;
			levelArray2[6]=true;
			levelArray2[7]=4;
			levelArray2[8]=0;
			levelArray2[9]=true;
			levelArray2[10]=false;
			levelArray2[13]="DreamLevel1";
			
			var levelArray3:Array=new Array;
			
			levelArray3[0]=1;
			
			var levelArray4:Array=new Array;
			
			
			LevelNow = new Level1(levelArray,"DreamBackGround",levelArray2,levelArray3,levelArray4);
		}
		private function onAdded (e:Event):void
		{
			//AddLevelFive();
			//addChild(LevelNow);
			//Test.clear();
			if(Test.data.PlayLevel == undefined)
			{
			    this.AddLevelOne();
				Test.data.PlayLevel = 1;
				Test.flush();
				addChild(LevelNow);
			}
			else
			{
				if(Test.data.PlayLevel == 1){AddLevelOne();}
				if(Test.data.PlayLevel == 2){AddLevelTwo();}
				if(Test.data.PlayLevel == 3){AddLevelThree();}
				if(Test.data.PlayLevel == 4){AddLevelFour();}
				if(Test.data.PlayLevel == 5){AddLevelFive();}
			   addChild(LevelNow);
			}
		}
		public var MouseX:Number;
		public var MouseY:Number;
		private function GetMouseXY(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(this);
			if( touch != null && touch.phase == TouchPhase.HOVER )
			{
				var location:Point = touch.getLocation(this);
				MouseX=location.x;
				MouseY=location.y;	
			}
		}
	}
} 