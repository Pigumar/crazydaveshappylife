package other
{
	//import flash.display.Bitmap;
	
	import button.MButton;
	import button.TouchToPlant;
	
	import plant.Plant;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	import zombie.BrainEater;
	import zombie.DaveZombie;
	import zombie.Zombie;
	
	public class Level extends Sprite
	{
		public var speed:uint = 1;
		public var i:int;
		public var backGroundImg:Image;
		public var sunVaseImg:Image;
		public var RSPMovie:MovieClip;
		public var vecRspFrames:Vector.<Texture>;
		public var bNeedToSetPlants:Boolean;
		public var bNeedToLockPlantCards:Boolean;
		public var bNeedToChoosePlant:Boolean;
		public var uiBeginSunWith:int;
		public var uiCardNumber:uint=0;
		public var sunVase:SunVase;
		public var cardCodeList:Array;
		public var vecMousePhasePlant1:Vector.<Texture>;
		public var vecMousePhasePlant2:Vector.<Texture>;
		public var vecMousePhasePlant3:Vector.<Texture>;
		public var vecMousePhasePlant4:Vector.<Texture>;
		public var imgMousePhasePlant1:Image;
		public var imgMousePhasePlant2:Image;
		public var imgMousePhasePlant3:Image;
		public var imgMousePhasePlant4:Image;
		public var vecRIPPO:Vector.<Texture>;
		public var arrLine:Array=new Array();
		public var bNeedToDropSunVase:Boolean=true;
		public var uiAbleLines:uint=31;
		
		public var iPlantNum:int=0;
		public var touchToPlant:TouchToPlant = new TouchToPlant;
		
		public var uiCardNumberNow:uint=0;
		public var uiCardNumberValue:uint=0;
		
		public var arrLevelContinue:Array=new Array;
		public var ileveltypecount:int=0;
		public var ileveltimecount:int=0;
		public var ilevelcount:int=0;
		public var uichaseLine:uint=5;
		public var uichaseRow:uint=0;
		public var bIfEndEnterframe:Boolean = false;
		
		public function KilledChaseZombie():Boolean
		{
			if(uichaseLine==5)return false;
			if(arrLine[uichaseLine].Zombies[uichaseRow]==null)
			{
				ileveltimecount=arrLevelContinue[ilevelcount+1];
				return true;
			}
			return false;
		}
		public var dProgressBarWidth:Number;
		public var dDevideZombies:Number;
		public var dCanGotProgressBarWidth:Number;
		public var dGotProgressBarWidth:Number;
		
		public var IfBeganPushTip:Boolean=false;
		public function PushTip(e:Event):void
		{
			var c:uint = 0;
			while(c < speed)
			{
				if(dGotProgressBarWidth < dCanGotProgressBarWidth)
				{
					ProgressBarTip.x -= 0.5;
					ProgressBarTip.width += 0.5;
					dGotProgressBarWidth += 0.5;
					ProgressBarHead.x -= 0.5;
				}
				c++;
			}
		}
		public function LevelContinue():void
		{
			//trace(ileveltypecount+" "+ileveltimecount+" "+ilevelcount+" "+uichaseLine+" "+uichaseRow);
			if(arrLevelContinue[ileveltypecount]=="Level2_Tip:")
			{
				//trace("Ridiculous AS3.0");
				addChild(new Tips("Tip10", 144));
				ileveltypecount ++;
				ilevelcount = ileveltypecount;
				ileveltimecount=0;
			}
			if(arrLevelContinue[ileveltypecount]=="SetFlagMassage:")
			{
				dGotProgressBarWidth = 0;
				dCanGotProgressBarWidth = 0;
				dProgressBarWidth = arrLevelContinue[ileveltypecount+1];
				dDevideZombies = arrLevelContinue[ileveltypecount+2];
				ileveltypecount +=3;
				ilevelcount = ileveltypecount;
				ileveltimecount=0;
				Flagcount=0;
			}
			if(arrLevelContinue[ileveltypecount]=="Begin:")
			{
				if(!IfBeganPushTip)
				{
					IfBeganPushTip = true;
					addEventListener(Event.ENTER_FRAME, PushTip);
				}
				ileveltimecount++;
				//trace(ileveltimecount);
				if(ileveltimecount==arrLevelContinue[ilevelcount+1]||KilledChaseZombie())
				{
					var s:uint=Math.ceil(Math.random()*10)%5;
					while(arrLine[s]==null)
					{s=Math.ceil(Math.random()*10)%5;}
						
					var Zombiey:int;
					switch(s)
					{
						case 0:Zombiey=54;break;
						case 1:Zombiey=135;break;
						case 2:Zombiey=216;break;
						case 3:Zombiey=297;break;
						case 4:Zombiey=378;break;
					}
					uichaseLine = s;
					arrLine[s].AddZombie(arrLevelContinue[ilevelcount+2],818,Zombiey,true);
					dCanGotProgressBarWidth += (dProgressBarWidth/dDevideZombies);
					trace("Add");
					ilevelcount+=2;
					if(arrLevelContinue[ilevelcount+1] is String)
					{
						ileveltypecount = ilevelcount+1;
						ilevelcount = ileveltypecount+3;
					    ileveltimecount=0;
					}
				}
			}
			if(arrLevelContinue[ileveltypecount]=="Continue:")
			{
				ileveltimecount++;
				if(ileveltimecount==arrLevelContinue[ileveltypecount+1])
				{
					ileveltimecount=0;
					var s:uint=Math.ceil(Math.random()*10)%5;
					while(arrLine[s]==null)
					{s=Math.ceil(Math.random()*10)%5;}
					
					var Zombiey:int;
					switch(s)
					{
						case 0:Zombiey=54;break;
						case 1:Zombiey=135;break;
						case 2:Zombiey=216;break;
						case 3:Zombiey=297;break;
						case 4:Zombiey=378;break;
					}
					arrLine[s].AddZombie(arrLevelContinue[ilevelcount],818,Zombiey);
					dCanGotProgressBarWidth += (dProgressBarWidth/dDevideZombies);
					trace("Add");
					ilevelcount+=1;
					if(arrLevelContinue[ilevelcount+1] is String)
					{
						ileveltypecount = ilevelcount+1;
						ilevelcount++;
						ileveltimecount=0;
					}
				}
			}
			if(arrLevelContinue[ileveltypecount]=="Flag:")
			{
				ileveltypecount ++;
				//ilevelcount = ileveltypecount;
				ileveltimecount=0;
				imgHugeWaveZombiealarm = new Image(Assets.getTexture("FlagSign"));
				imgHugeWaveZombiealarm.x = 400 - imgHugeWaveZombiealarm.width / 2;
				imgHugeWaveZombiealarm.y = 300 - imgHugeWaveZombiealarm.height / 2;
				addChild(imgHugeWaveZombiealarm);
				imgHugeWaveZombiealarm.alpha=0;
				Flagcount=0;
				addEventListener(Event.ENTER_FRAME, FlagFrames);
			}
			if(arrLevelContinue[ileveltypecount]=="FinalFlag:")
			{
				if(imgHugeWaveZombiealarm != null){return;}
				//trace("I'm HandSome!");
				ileveltimecount++;
				if(ileveltimecount==144)
				{
					ileveltypecount ++;
					ilevelcount = ileveltypecount;
					ileveltimecount=0;
					imgHugeWaveZombiealarm = new Image(Assets.getTexture("FinalFlagSign"));
					imgHugeWaveZombiealarm.x = 400 - imgHugeWaveZombiealarm.width / 2;
					imgHugeWaveZombiealarm.y = 300 - imgHugeWaveZombiealarm.height / 2;
					
					addChild(imgHugeWaveZombiealarm);
					imgHugeWaveZombiealarm.alpha=0;
					Flagcount=0;
					addEventListener(Event.ENTER_FRAME, FlagFrames);
				}
			}
			if(arrLevelContinue[ileveltypecount]=="AddProgressBar:")
			{
				ileveltypecount ++;
				//ilevelcount = ileveltypecount;
				ileveltimecount=0;
				Flagcount=0;
				AddProgressBar();
			}
			if(arrLevelContinue[ileveltypecount]=="RaiseFlags:")
			{
				ileveltypecount += 2;
				ilevelcount = ileveltypecount - 1;
				ileveltimecount=0;
				Flagcount=0;
				RaiseFlag(arrLevelContinue[ilevelcount]);
				ilevelcount ++;
			}
			if(arrLevelContinue[ileveltypecount]=="ProducedAllZombiesFromFlag:")
			{
				ileveltypecount ++;
				ilevelcount = ileveltypecount;
				ileveltimecount=0;
				Flagcount=0;
				dCanGotProgressBarWidth += (dProgressBarWidth/dDevideZombies);
			}
			if(arrLevelContinue[ileveltypecount]=="EndProducing:" && OnGroundZombies <= 0)
			{
				trace("Win!");
				speed = 0;
				stopAllMc(this);
				Paused = true;
				ileveltypecount ++;
				for(var i:uint = 0;i < this.numChildren; i++)
				{
					if(getChildAt(i) is DisplayObject)
					{
						getChildAt(i).touchable = false;
						if(getChildAt(i) is Sprite)
						{
							getChildAt(i).flatten();
						}
					}
				}
				if(PrizeTexture != null)
				{
					Prize = new Image(PrizeTexture);
					addChild(Prize);
					Prize.x = prizex;
					Prize.y = prizey;
					PrizeCovery = new MButton(PrizeTexture,new Image(PrizeTexture),new Image(PrizeTexture),6);
					addChild(PrizeCovery);
					PrizeCovery.x = prizex;
					PrizeCovery.y = prizey;
					PrizeCovery.Dark(0);
					PrizeCovery.alpha = 0.01;
					this.pauseButton.visible = false;
					this.speedButton.visible = false;
					this.slowButton.visible = false;
				}
				else
				{
					Prize = new Card(PrizeCardNum,-2);
					addChild(Prize);
					Prize.x = prizex;
					Prize.y = prizey;
					addChild(PrizeCovery);
					PrizeCovery.x = prizex;
					PrizeCovery.y = prizey;
					PrizeCovery.Dark(0);
					PrizeCovery.alpha = 0.01;
					this.pauseButton.visible = false;
					this.speedButton.visible = false;
					this.slowButton.visible = false;
				}
				addEventListener(Event.ENTER_FRAME,afterwin);
			}
		}
		public var PrizeCovery:MButton = new MButton(Assets.getTexture("PlantCardBody"),new Image(Assets.getTexture("PlantCardBody")),new Image(Assets.getTexture("PlantCardBody")),6);
		public var ProduceCount:uint=1;
		public var DropTime:Number=Math.ceil(Math.random()*9+15);
		public var FlyMistake:Number=Math.ceil(Math.random()*2);
		public var Power:Number=Math.ceil(Math.random()*4+5);
		public function afterwin(e:Event):void
		{
			ProduceCount++;
			if(DropTime/2>=ProduceCount)
			{
				Prize.x-=FlyMistake;
				Prize.y-=Power;
				PrizeCovery.x-=FlyMistake;
				PrizeCovery.y-=Power;
			}
			if(DropTime/2<ProduceCount)
			{
				Prize.x-=FlyMistake;
				Prize.y+=Power;
				PrizeCovery.x-=FlyMistake;
				PrizeCovery.y+=Power;
			}
			if(DropTime<=ProduceCount)
			{
				bIfWin = true;
				removeEventListener(Event.ENTER_FRAME,afterwin);
				addEventListener(Event.ENTER_FRAME,flashPrizeCovery);
				return;
			}
		}
		public var bIfDarker:Boolean = true;
		public function flashPrizeCovery(e:Event):void
		{
			if(bIfDarker)
			{
				if(PrizeCovery.alpha >= 1)
				{
					bIfDarker = false;
					return;
				}
				PrizeCovery.alpha +=  0.021;
			}
			
			if(!bIfDarker)
			{
				if(PrizeCovery.alpha <= 0.021)
				{
					bIfDarker = true;
					return;
				}
				PrizeCovery.alpha -=  0.021;
			}
		}
		public var dgetPrizex:Number;
		public var dgetPrizey:Number;
		public var dfinalPrizex:Number;
		public var dfinalPrizey:Number;
		public var dfinalPrizeheight:Number;
		public var dfinalPrizewidth:Number;
		public var dgetPrizeheight:Number;
		public var dgetPrizewidth:Number;
		public var dgetPrizecount:uint = 0;
		public function getPrize():void
		{
			dfinalPrizeheight = Prize.height*1.72;
			dfinalPrizewidth = Prize.width*1.72;
			dgetPrizeheight = Prize.height*0.01;
			dgetPrizewidth = Prize.width*0.01;
			dfinalPrizex = 400 - dfinalPrizewidth/2;
			dfinalPrizey = 300 - dfinalPrizeheight/2;
			dgetPrizex = (dfinalPrizex - Prize.x)/72;
			dgetPrizey = (dfinalPrizey - Prize.y)/72;
			PrizeCovery.visible = false;
			trace(dgetPrizex);
			trace(dgetPrizey);
			trace(dfinalPrizex);
			trace(dfinalPrizey);
			trace(dfinalPrizeheight);
			trace(dfinalPrizewidth);
			trace(dgetPrizeheight);
			trace(dgetPrizewidth);
			addEventListener(Event.ENTER_FRAME,GettingPrize);
		}
		public var NextLevelButton:MButton = new MButton(Assets.getTexture("nextlevelbutton"),new Image(Assets.getTexture("nextlevelbutton")),new Image(Assets.getTexture("nextlevelbutton")),7);
		public var BackButton:MButton = new MButton(Assets.getTexture("CardOnState"),new Image(Assets.getTexture("CardOnState")),new Image(Assets.getTexture("CardOnState")),8);
		public function GettingPrize (e:Event):void
		{
			dgetPrizecount ++;
			if(dgetPrizecount >= 120){return;}/*
			if(dgetPrizecount == 18)
			{
				PrizeRay1 = new GetPrizeLight();
				addChild(PrizeRay1);
			}
			if(dgetPrizecount == 36)
			{
				PrizeRay2 = new GetPrizeLight();
				addChild(PrizeRay2);
			}
			if(dgetPrizecount == 54)
			{
				PrizeRay3 = new GetPrizeLight();
				addChild(PrizeRay3);
			}
			if(dgetPrizecount == 71)
			{
				PrizeRay4 = new GetPrizeLight();
				addChild(PrizeRay4);
			}*/
			if(dgetPrizecount == 119)
			{
				addChild(NextLevelButton);
				//addChild(BackButton);
				BackButton.x = 200;
			}
			if(dgetPrizecount == 72)
			{
				//PrizeRay4 = new GetPrizeLight();
				EndPrizeCover = new Image(Assets.getTexture("WhiteSquare"));
				addChild(EndPrizeCover);
				EndPrizeCover.width = 800;
				EndPrizeCover.height = 600;
				EndPrizeCover.alpha = 0;
			}
			if(dgetPrizecount > 72)
			{
				//PrizeRay4 = new GetPrizeLight();
				EndPrizeCover.alpha += 0.021;
				return;
			}
			Prize.height += dgetPrizeheight;
			Prize.width += dgetPrizewidth;
			Prize.x += dgetPrizex;
			Prize.y += dgetPrizey;
			
			if(PrizeRay1 != null){PrizeRay1.x = Prize.x + (Prize.width/2);PrizeRay1.y = Prize.y + (Prize.height/2);}
			if(PrizeRay2 != null){PrizeRay2.x = Prize.x + (Prize.width/2);PrizeRay2.y = Prize.y + (Prize.height/2);}
			if(PrizeRay3 != null){PrizeRay3.x = Prize.x + (Prize.width/2);PrizeRay3.y = Prize.y + (Prize.height/2);}
			if(PrizeRay4 != null){PrizeRay4.x = Prize.x + (Prize.width/2);PrizeRay4.y = Prize.y + (Prize.height/2);}
		}
		public var EndPrizeCover:Image;
		public var PrizeRay1:GetPrizeLight = null;
		public var PrizeRay2:GetPrizeLight = null;
		public var PrizeRay3:GetPrizeLight = null;
		public var PrizeRay4:GetPrizeLight = null;
		
		public var bIfWin:Boolean = false;
		public var PrizeXinTable:Number;
		public var PrizeYinTable:Number;
		public var PrizeX:Number = 0;
		public var prizex:int,prizey:int;
		public var Prize:DisplayObject;
		public var OnGroundZombies:Number = 0;
		public var PreRaisingFlag:uint;
		public var raisingFlagCount:uint = 0;
		public function RaiseFlag(Index:int):void
		{
			PreRaisingFlag = Index;
			raisingFlagCount = 0;
			addEventListener(Event.ENTER_FRAME, RaisingFlag);
		}
		public function RaisingFlag(e:Event):void
		{
			
			var c:uint = 0;
			while(c < speed)
			{
				raisingFlagCount++;
				ProgressBarFlags[PreRaisingFlag].y -= 1;
				if(raisingFlagCount == 37)
				{
					removeEventListener(Event.ENTER_FRAME, RaisingFlag);
					return;
				}
				c++;
			}
		}
		public var ProgressBar:Image = new Image(Assets.getTexture("ProgressBar"));
		public var ProgressBarTip:Image = new Image(Assets.getTexture("ProgressBarTip"));
		public var ProgressBarTop:Image = new Image(Assets.getTexture("ProgressBarTop"));
		public var ProgressBarHead:Image;
		public var ProgressBarFlags:Vector.<Image> = new Vector.<Image>(4, true);
		public function AddProgressBar():void
		{
			ProgressBar.x = 645.5;
			ProgressBar.y = 555;
			ProgressBarTip.width = 1;
			ProgressBarTip.x = 764.8;
			ProgressBarTip.y = 557.7;
			ProgressBarTop.x = 645.5;
			ProgressBarTop.y = 555;
			ProgressBarHead.x = 765.3 - ProgressBarHead.width / 2;
			ProgressBarHead.y = 560.1 - ProgressBarHead.height / 2;
			addChild(ProgressBar);
			addChild(ProgressBarTip);
			addChild(ProgressBarTop);
			for(i = 0; i < Flags; i++)
			{
				addChild(ProgressBarFlags[i]);
				ProgressBarFlags[i].y = 533;
				ProgressBarFlags[i].x = 761.1 - (109.4/(i+1)) * (i+1);
				//_+_+_+_+_+_+_+_+_+
			}
			addChild(ProgressBarHead);
			//addChild(ProgressBarHead);
			
		}
		public var Flagcount:uint=0;
		public function FlagFrames(e:Event):void
		{
			
			var c:uint = 0;
			while(c < speed)
			{
				Flagcount++;
				if(Flagcount<15)
				{
					imgHugeWaveZombiealarm.alpha+=0.07;
				}
				if(Flagcount==15)
					imgHugeWaveZombiealarm.alpha=1;
				if(Flagcount>87)
				{
					imgHugeWaveZombiealarm.alpha-=0.11;
				}
				if(Flagcount>96)
				{
					removeChild(imgHugeWaveZombiealarm);
					imgHugeWaveZombiealarm.dispose();
					imgHugeWaveZombiealarm = null;
					removeEventListener(Event.ENTER_FRAME, FlagFrames);
					return;
				}
				c++;
			}
		}
		public var Flags:uint;
		public var imgHugeWaveZombiealarm:Image = new Image(Assets.getTexture("FlagSign"));
		public var Zombiewon:Image;//+_+_+_+_+_+_+_+_-
		public var ZombiewonText:Image;
		public function ZombieWon(I:Array, Ix:Array, Iy:Array, X:Number, Y:Number):void
		{
			stopAllMc(this);
			speed = 0;
			Zombiewon = new Image(Assets.getTexture("BlackSquare"));
			ZombiewonText = new Image(Assets.getTexture(ZombieWonName));
			ZombiewonText.x = 399;
			ZombiewonText.y = 300;
			ZombiewonText.width = 3.45;
			ZombiewonText.height = 3.05;
			addChild(Zombiewon);
			Zombiewon.width = 800;
			Zombiewon.height = 600;
			Zombiewon.alpha = 0;
			removeEventListener(Event.ENTER_FRAME,onEnterframe);//_+_+_+_+()(}}
			addEventListener(Event.ENTER_FRAME, ZombieWonFrame);
			var Killer:BrainEater = new BrainEater(I,Ix,Iy);
			addChild(Killer);
			Killer.x = X;
			Killer.y = Y;
			addChild(ZombiewonText);
		}
		public var ZombieWonCount:uint = 0;
		public function ZombieWonFrame(e:Event):void
		{
			ZombieWonCount++;
			Zombiewon.alpha += 0.02;
			if(ZombieWonCount==49)
			Zombiewon.alpha = 1;
			if(48<ZombieWonCount && ZombieWonCount<=64)
			{
				ZombiewonText.x -= 10.16;
				ZombiewonText.y -= 8.9;
				ZombiewonText.width += 20.33;
				ZombiewonText.height += 17.6;
			}
			if(ZombieWonCount == 65 || ZombieWonCount == 66)
			{
				ZombiewonText.x = 242.8;
				ZombiewonText.y = 152.4;
			}
			if(ZombieWonCount == 67 || ZombieWonCount == 68)
			{
				ZombiewonText.x = 239;
				ZombiewonText.y = 148;
			}
			if(ZombieWonCount == 69 || ZombieWonCount == 70)
			{
				ZombiewonText.x = 225;
				ZombiewonText.y = 153;
				ZombiewonText.width = 355;
				ZombiewonText.height = 309;
			}
			if(ZombieWonCount == 71 || ZombieWonCount == 72)
			{
				ZombiewonText.x = 235;
				ZombiewonText.y = 142;
			}
			if(ZombieWonCount == 73 || ZombieWonCount == 74)
			{
				ZombiewonText.x = 246;
				ZombiewonText.y = 143;
				ZombiewonText.width = 349;
				ZombiewonText.height = 304;
			}
			if(ZombieWonCount == 75 || ZombieWonCount == 76)
			{
				ZombiewonText.x = 228;
				ZombiewonText.y = 145;
				ZombiewonText.width = 359;
				ZombiewonText.height = 312.5;
			}
			if(ZombieWonCount == 77 || ZombieWonCount == 78)
			{
				ZombiewonText.x = 244;
				ZombiewonText.y = 154;
				ZombiewonText.width = 339;
				ZombiewonText.height = 296;
			}
			if(ZombieWonCount == 79 || ZombieWonCount == 80)
			{
				ZombiewonText.x = 240;
				ZombiewonText.y = 149;
				ZombiewonText.width = 348;
				ZombiewonText.height = 303;
			}
			if(ZombieWonCount == 81 || ZombieWonCount == 82)
			{
				ZombiewonText.x = 240;
				ZombiewonText.y = 146;
			}
			if(ZombieWonCount == 83 || ZombieWonCount == 84)
			{
				ZombiewonText.x = 243;
				ZombiewonText.y = 153;
			}
			if(ZombieWonCount == 85 || ZombieWonCount == 86)
			{
				ZombiewonText.x = 225;
				ZombiewonText.y = 153;
			}
			if(ZombieWonCount == 87)
			{
				ZombiewonText.x = 216;
				ZombiewonText.y = 140;
				ZombiewonText.width = 367;
				ZombiewonText.height = 320;
			}
		}
		public var ZombieWonName:String = "ZombieWonBrain";
		public var bIfneedtoShovel:Boolean = true;
		public var PrizeCardNum:int = -1;
		public var PrizeTexture:Texture = null;
		public function Level(showzombielist:Array=null, sceneType:String="DreamBackGround", otherMessage:Array=null, cardCodeList:Array=null, LevelContinue:Array=null/*, showzombienum:uint=0, IfNeedRSP:Boolean=true, IfNeedLockedCards:Boolean=true, IfNeedChoosePlant:Boolean=true, PlantNumber:uint=0*/)
		{
			Code = otherMessage[13];
			if(otherMessage[11] == "C")
			{
				PrizeCardNum = otherMessage[12];
			}
			if(otherMessage[11] == "T")
			{
				PrizeTexture = otherMessage[12];
			}
			arrLevelContinue = LevelContinue;
			if(sceneType=="DreamBackGround")
			{
				ZombieWonName = "ZombieWonCorn";
				backGroundImg = new Image(Assets.getTexture("Dream_BackGround"));
				ProgressBarHead = new Image(Assets.getTexture("ProgressBarHead_Dream"));
				Flags = otherMessage[8];
				for(i = 0; i < Flags; i++)
				{
					ProgressBarFlags[i] = new Image(Assets.getTexture("ProgressBarFlag_Dream"));
					//_+_+_+_+_+_+_+_+_+
				}
			}
			//sunVaseImg = new Image(Texture.fromBitmap(new MovingSunVaseImg()));
			sunVaseImg = new Image(Assets.getTexture("PuttingSunVase"));
			
			showZombieNum = otherMessage[0];
			showZombieList = showzombielist;
			
			vecRspFrames = Assets.getTextures("ReadySetPlants_SpriteSheet","ReadySetPlants_SpriteSheetXML","ReadySetPlants_SpriteSheet");//(new TextureAtlas(Texture.fromBitmap(new RSPSpriteSheet()), XML(new RSPSpriteSheetXML()))).getTextures("ReadySetPlants_SpriteSheet");
			
			bNeedToSetPlants=otherMessage[1];
			bNeedToLockPlantCards=otherMessage[2];
			bNeedToChoosePlant=otherMessage[3];
			uiCardNumber=otherMessage[4];
			uiBeginSunWith=otherMessage[5];
			bNeedToDropSunVase=otherMessage[6];
			this.uiAbleLines = otherMessage[7];
			bIfEndEnterframe = otherMessage[9];
			bIfneedtoShovel = otherMessage[10];
			this.cardCodeList = cardCodeList;
			
			sunVase = new SunVase(uiBeginSunWith,sceneType);
			
			showZombies();
			
			//vecMousePhasePlant1 = new TextureAtlas(Texture.fromBitmap(new MCPlant1()), XML(new MCPlant1XML())).getTextures("MCPlantP1");
			vecMousePhasePlant1 = Assets.getTextures("MCPlantP1", "MCPlantP1XML","MCPlantP1");
			//vecMousePhasePlant2 = new TextureAtlas(Texture.fromBitmap(new MCPlant2()), XML(new MCPlant2XML())).getTextures("MCPlantP2");
			vecMousePhasePlant2 = Assets.getTextures("MCPlantP2", "MCPlantP2XML","MCPlantP2");
			//vecMousePhasePlant3 = new TextureAtlas(Texture.fromBitmap(new MCPlant3()), XML(new MCPlant3XML())).getTextures("MCPlantP3");
			vecMousePhasePlant3 = Assets.getTextures("MCPlantP3", "MCPlantP3XML","MCPlantP3");
			//vecMousePhasePlant4 = new TextureAtlas(Texture.fromBitmap(new MCPlant4()), XML(new MCPlant4XML())).getTextures("MCPlantP4");
			vecMousePhasePlant4 = Assets.getTextures("MCPlantP4", "MCPlantP4XML","MCPlantP4");
			imgMousePhasePlant1 = null;
			imgMousePhasePlant2 = null;
			imgMousePhasePlant3 = null;
			imgMousePhasePlant4 = null;
			//vecRIPPO = new TextureAtlas(Texture.fromBitmap(new RIPPC()), XML(new RIPPCXML())).getTextures("ReadyImagePutPlants");
			vecRIPPO = Assets.getTextures("ReadyImagePutPlants","ReadyImagePutPlantsXML","ReadyImagePutPlants");
			ReadyputImageofPlant=null;
			
			
		}
		public function DPMCP():void
		{
			if(imgMousePhasePlant1!=null)
			{//vecMousePhasePlant1
				removeChild(imgMousePhasePlant1);
				imgMousePhasePlant1.dispose();
				imgMousePhasePlant1=null;
				removeChild(imgMousePhasePlant2);
				imgMousePhasePlant2.dispose();
				imgMousePhasePlant2=null;
				removeChild(imgMousePhasePlant3);
				imgMousePhasePlant3.dispose();
				imgMousePhasePlant3=null;
				removeChild(imgMousePhasePlant4);
				imgMousePhasePlant4.dispose();
				imgMousePhasePlant4=null;
			}
		}
		public function RIPMisX(c:uint):Number
		{
			switch(c)
			{
				case 1:return 0;
				case 2:return -15;
				case 3:return -16;
				case 4:return -16;
				default:return 0;
			}
		}
		public function RIPMisY(c:uint):Number
		{
			switch(c)
			{
				case 1:return 0;
				case 2:return 7;
				case 3:return 4;
				case 3:return 8;
				default:return 0;
			}
		}
		public var addedReadyputImageofPlant:Boolean=false;
		public var ReadyputImageofPlant:Image;
		public function ReadyImagePut():void
		{
			if(iPlantNum==-1)
			{
				ReadyputImageofPlant.visible=false;return;
			}
			if(imgMousePhasePlant1==null)
			{
				return;
			}
			addedReadyputImageofPlant=false;
			var xx:int=parent.MouseX;
			var yy:int=parent.MouseY;
			ReadyputImageofPlant.visible = false;
			
			if(yy >= 140.9 && yy <= 176.9)
			{
				if(arrLine[0]==null)
					return;
				if(xx>=150.3&&xx<=186.6){if(arrLine[0].Plants[0]!=null){return;}ReadyputImageofPlant.x=137+RIPMisX(iPlantNum);ReadyputImageofPlant.y=98+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=224.3&&xx<=260.6){if(arrLine[0].Plants[1]!=null){return;}ReadyputImageofPlant.x=207+RIPMisX(iPlantNum);ReadyputImageofPlant.y=98+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=295.3&&xx<=331.6){if(arrLine[0].Plants[2]!=null){return;}ReadyputImageofPlant.x=278+RIPMisX(iPlantNum);ReadyputImageofPlant.y=98+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=364.3&&xx<=401.6){if(arrLine[0].Plants[3]!=null){return;}ReadyputImageofPlant.x=348+RIPMisX(iPlantNum);ReadyputImageofPlant.y=98+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=437.3&&xx<=473.6){if(arrLine[0].Plants[4]!=null){return;}ReadyputImageofPlant.x=420+RIPMisX(iPlantNum);ReadyputImageofPlant.y=98+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=505.3&&xx<=541.6){if(arrLine[0].Plants[5]!=null){return;}ReadyputImageofPlant.x=497+RIPMisX(iPlantNum);ReadyputImageofPlant.y=98+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=573.3&&xx<=610.6){if(arrLine[0].Plants[6]!=null){return;}ReadyputImageofPlant.x=557+RIPMisX(iPlantNum);ReadyputImageofPlant.y=98+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=644.3&&xx<=681.6){if(arrLine[0].Plants[7]!=null){return;}ReadyputImageofPlant.x=627+RIPMisX(iPlantNum);ReadyputImageofPlant.y=98+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=714.3&&xx<=750.6){if(arrLine[0].Plants[8]!=null){return;}ReadyputImageofPlant.x=697+RIPMisX(iPlantNum);ReadyputImageofPlant.y=98+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
			}
			else if(yy>=222.3&&yy<=258.3)
			{
				if(arrLine[1]==null)
					return;
				if(xx>=150.3&&xx<=186.6){if(arrLine[1].Plants[0]!=null){return;}ReadyputImageofPlant.x=137+RIPMisX(iPlantNum);ReadyputImageofPlant.y=180+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=224.3&&xx<=260.6){if(arrLine[1].Plants[1]!=null){return;}ReadyputImageofPlant.x=207+RIPMisX(iPlantNum);ReadyputImageofPlant.y=180+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=295.3&&xx<=331.6){if(arrLine[1].Plants[2]!=null){return;}ReadyputImageofPlant.x=278+RIPMisX(iPlantNum);ReadyputImageofPlant.y=180+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=364.3&&xx<=401.6){if(arrLine[1].Plants[3]!=null){return;}ReadyputImageofPlant.x=348+RIPMisX(iPlantNum);ReadyputImageofPlant.y=180+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=437.3&&xx<=473.6){if(arrLine[1].Plants[4]!=null){return;}ReadyputImageofPlant.x=420+RIPMisX(iPlantNum);ReadyputImageofPlant.y=180+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=505.3&&xx<=541.6){if(arrLine[1].Plants[5]!=null){return;}ReadyputImageofPlant.x=497+RIPMisX(iPlantNum);ReadyputImageofPlant.y=180+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=573.3&&xx<=610.6){if(arrLine[1].Plants[6]!=null){return;}ReadyputImageofPlant.x=557+RIPMisX(iPlantNum);ReadyputImageofPlant.y=180+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=644.3&&xx<=681.6){if(arrLine[1].Plants[7]!=null){return;}ReadyputImageofPlant.x=627+RIPMisX(iPlantNum);ReadyputImageofPlant.y=180+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=714.3&&xx<=750.6){if(arrLine[1].Plants[8]!=null){return;}ReadyputImageofPlant.x=697+RIPMisX(iPlantNum);ReadyputImageofPlant.y=180+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
			}
			else if(yy>=308.3&&yy<=351.25)
			{
				if(arrLine[2]==null)
					return;
				if(xx>=150.3&&xx<=186.6){if(arrLine[2].Plants[0]!=null){return;}ReadyputImageofPlant.x=137+RIPMisX(iPlantNum);ReadyputImageofPlant.y=261+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=224.3&&xx<=260.6){if(arrLine[2].Plants[1]!=null){return;}ReadyputImageofPlant.x=207+RIPMisX(iPlantNum);ReadyputImageofPlant.y=261+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=295.3&&xx<=331.6){if(arrLine[2].Plants[2]!=null){return;}ReadyputImageofPlant.x=278+RIPMisX(iPlantNum);ReadyputImageofPlant.y=261+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=364.3&&xx<=401.6){if(arrLine[2].Plants[3]!=null){return;}ReadyputImageofPlant.x=348+RIPMisX(iPlantNum);ReadyputImageofPlant.y=261+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=437.3&&xx<=473.6){if(arrLine[2].Plants[4]!=null){return;}ReadyputImageofPlant.x=420+RIPMisX(iPlantNum);ReadyputImageofPlant.y=261+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=505.3&&xx<=541.6){if(arrLine[2].Plants[5]!=null){return;}ReadyputImageofPlant.x=497+RIPMisX(iPlantNum);ReadyputImageofPlant.y=261+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=573.3&&xx<=610.6){if(arrLine[2].Plants[6]!=null){return;}ReadyputImageofPlant.x=557+RIPMisX(iPlantNum);ReadyputImageofPlant.y=261+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=644.3&&xx<=681.6){if(arrLine[2].Plants[7]!=null){return;}ReadyputImageofPlant.x=627+RIPMisX(iPlantNum);ReadyputImageofPlant.y=261+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=714.3&&xx<=750.6){if(arrLine[2].Plants[8]!=null){return;}ReadyputImageofPlant.x=697+RIPMisX(iPlantNum);ReadyputImageofPlant.y=261+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
			}
			else if(yy>=387.2&&yy<=423.2)
			{
				if(arrLine[3]==null)
					return;
				if(xx>=150.3&&xx<=186.6){if(arrLine[3].Plants[0]!=null){return;}ReadyputImageofPlant.x=137+RIPMisX(iPlantNum);ReadyputImageofPlant.y=345+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=224.3&&xx<=260.6){if(arrLine[3].Plants[1]!=null){return;}ReadyputImageofPlant.x=207+RIPMisX(iPlantNum);ReadyputImageofPlant.y=345+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=295.3&&xx<=331.6){if(arrLine[3].Plants[2]!=null){return;}ReadyputImageofPlant.x=278+RIPMisX(iPlantNum);ReadyputImageofPlant.y=345+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=364.3&&xx<=401.6){if(arrLine[3].Plants[3]!=null){return;}ReadyputImageofPlant.x=348+RIPMisX(iPlantNum);ReadyputImageofPlant.y=345+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=437.3&&xx<=473.6){if(arrLine[3].Plants[4]!=null){return;}ReadyputImageofPlant.x=420+RIPMisX(iPlantNum);ReadyputImageofPlant.y=345+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=505.3&&xx<=541.6){if(arrLine[3].Plants[5]!=null){return;}ReadyputImageofPlant.x=497+RIPMisX(iPlantNum);ReadyputImageofPlant.y=345+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=573.3&&xx<=610.6){if(arrLine[3].Plants[6]!=null){return;}ReadyputImageofPlant.x=557+RIPMisX(iPlantNum);ReadyputImageofPlant.y=345+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=644.3&&xx<=681.6){if(arrLine[3].Plants[7]!=null){return;}ReadyputImageofPlant.x=627+RIPMisX(iPlantNum);ReadyputImageofPlant.y=345+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=714.3&&xx<=750.6){if(arrLine[3].Plants[8]!=null){return;}ReadyputImageofPlant.x=697+RIPMisX(iPlantNum);ReadyputImageofPlant.y=345+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
			}
			else if(yy>=473.2&&yy<=509.2)
			{
				if(arrLine[4]==null)
					return;
				if(xx>=150.3&&xx<=186.6){if(arrLine[4].Plants[0]!=null){return;}ReadyputImageofPlant.x=137+RIPMisX(iPlantNum);ReadyputImageofPlant.y=423+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=224.3&&xx<=260.6){if(arrLine[4].Plants[1]!=null){return;}ReadyputImageofPlant.x=207+RIPMisX(iPlantNum);ReadyputImageofPlant.y=423+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=295.3&&xx<=331.6){if(arrLine[4].Plants[2]!=null){return;}ReadyputImageofPlant.x=278+RIPMisX(iPlantNum);ReadyputImageofPlant.y=423+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=364.3&&xx<=401.6){if(arrLine[4].Plants[3]!=null){return;}ReadyputImageofPlant.x=348+RIPMisX(iPlantNum);ReadyputImageofPlant.y=423+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=437.3&&xx<=473.6){if(arrLine[4].Plants[4]!=null){return;}ReadyputImageofPlant.x=420+RIPMisX(iPlantNum);ReadyputImageofPlant.y=423+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=505.3&&xx<=541.6){if(arrLine[4].Plants[5]!=null){return;}ReadyputImageofPlant.x=497+RIPMisX(iPlantNum);ReadyputImageofPlant.y=423+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=573.3&&xx<=610.6){if(arrLine[4].Plants[6]!=null){return;}ReadyputImageofPlant.x=557+RIPMisX(iPlantNum);ReadyputImageofPlant.y=423+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=644.3&&xx<=681.6){if(arrLine[4].Plants[7]!=null){return;}ReadyputImageofPlant.x=627+RIPMisX(iPlantNum);ReadyputImageofPlant.y=423+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
				else if(xx>=714.3&&xx<=750.6){if(arrLine[4].Plants[8]!=null){return;}ReadyputImageofPlant.x=697+RIPMisX(iPlantNum);ReadyputImageofPlant.y=423+RIPMisY(iPlantNum);addedReadyputImageofPlant=true;}
			}
			if(addedReadyputImageofPlant)
			{
				ReadyputImageofPlant.visible=true;
			}
			//else
			//	trace("CLICKED...");
		}
		//Produce show Zombieimage
		public function createZombieImage(Num:uint):Sprite
		{
			var Target:Sprite=new Sprite();
			if( Num == 1)// normal dave zombie
			{
				return new DaveZombie(-1);
			}
			if(Num == 2) //dave zombie with hat
			{
				Target = new DaveZombie(-1);
				Target.WearHats();
				return Target;
			}
			if(Num == 4) //dave zombie with hat
			{
				Target = new DaveZombie(-1);
				Target.WearBuckets();
				return Target;
			}
			return Target;
		}
		public var showZombieList:Array=new Array;
		public var showZombieNum:uint;
		public var showZombieLayer:uint;
		public var arrZombieImage:Array=new Array;
		public function showZombies():void
		{
			addChild(backGroundImg);
			
			showZombieLayer=431/showZombieNum;
			
			for(i=0;i<showZombieNum;i++)
			{
				arrZombieImage[i] = createZombieImage(showZombieList[i]);
				addChild(arrZombieImage[i]);
				arrZombieImage[i].Show(Math.ceil(Math.random()*10)+19);
				arrZombieImage[i].x=1109+(Math.ceil(Math.random()*349));
				arrZombieImage[i].y=38.35+(showZombieLayer*i);
			}
			addEventListener(Event.ENTER_FRAME,WhenBackGroundinit);
		}
		public var MoveBackGroundSwitch:uint=1;
		public var MoveBackGroundCount:uint=0;
		public function WhenBackGroundinit(event:Event):void
		{
			
			var c:uint = 0;
			while(c < speed)
			{
				if(MoveBackGroundSwitch==1){MoveBackGroundCount++;if(MoveBackGroundCount==49){MoveBackGroundSwitch=2;MoveBackGroundCount=0;}}
				
				if(MoveBackGroundSwitch==2){MoveBackGroundCount++;backGroundImg.x-=12.22;for(i=0;i<showZombieNum;i++){arrZombieImage[i].x-=12.22;}if(MoveBackGroundCount==68){MoveBackGroundSwitch=3;MoveBackGroundCount=0;backGroundImg.x=-832.25;}}
				
				if(MoveBackGroundSwitch==3){MoveBackGroundCount++;if(bNeedToChoosePlant){MoveBackGroundSwitch=6;}if(MoveBackGroundCount==36){MoveBackGroundSwitch=4;MoveBackGroundCount=0;}}
				
				if(MoveBackGroundSwitch==4){MoveBackGroundCount++;backGroundImg.x+=17.19;for(i=0;i<showZombieNum;i++){arrZombieImage[i].x+=17.19;}if(MoveBackGroundCount==33){MoveBackGroundSwitch=5;MoveBackGroundCount=0;backGroundImg.x=-258.15;}}
				if(MoveBackGroundSwitch==5)
				{
					for(i=0;i<showZombieNum;i++){removeChild(arrZombieImage[i]);arrZombieImage[i].dispose();arrZombieImage[i]=null;}
					removeEventListener(Event.ENTER_FRAME,WhenBackGroundinit);
					if(bNeedToDropSunVase)
					{
						addChild(sunVaseImg);
						sunVaseImg.x=55.15;
						sunVaseImg.y=-115.9;
						i=0;
						addEventListener(Event.ENTER_FRAME,moveSunVase);
					}
					else
					{
						i=0;
						if(bNeedToSetPlants)
						{
							RSPMovie = new MovieClip(vecRspFrames, 24);
							addChild(RSPMovie);
							RSPMovie.x=327.7;RSPMovie.y=276;
							Starling.juggler.add(RSPMovie);
							addEventListener(Event.ENTER_FRAME,WaitRSP);
							return;
						}
						removeChild(sunVaseImg);
						sunVaseImg.dispose();
						sunVaseImg=null;
						addChild(sunVase);
						sunVase.x=55.15;
						sunVase.y=12.1;
						//addChild(new Sun_Drop());
						
						addEventListener(Event.ENTER_FRAME,onEnterframe);
						Cardinit();
					}
				}
				c++;
			}
		}
		public function moveSunVase(event:Event):void
		{
			
			var c:uint = 0;
			while(c < speed)
			{
				i++;
				if(i<=20)
				{sunVaseImg.y+=6.4;}
				if(i==21)
				{
					if(!bNeedToChoosePlant)
					{
						LockedCardinit();
						i=21;
					}
				}
				if(i==40)
				{
					removeEventListener(Event.ENTER_FRAME,moveSunVase);
					i=0;
					if(bNeedToSetPlants)
					{
						RSPMovie = new MovieClip(vecRspFrames, 24);
						addChild(RSPMovie);
						RSPMovie.x=327.7;RSPMovie.y=276;
						Starling.juggler.add(RSPMovie);
						addEventListener(Event.ENTER_FRAME,WaitRSP);
						return;
					}
					removeChild(sunVaseImg);
					sunVaseImg.dispose();
					sunVaseImg=null;
					addChild(sunVase);
					sunVase.x=55.15;
					sunVase.y=12.1;
					//addChild(new Sun_Drop());
					if(! bIfEndEnterframe)
					addEventListener(Event.ENTER_FRAME,onEnterframe);
					else
					bBeginSpecialWork = true;
					
					Cardinit();
				}
				c++;
			}
		}
		public var bBeginSpecialWork:Boolean = false;
		public function WaitRSP(event:Event):void
		{
			
			var c:uint = 0;
			while(c < speed)
			{
				i++;
				if(i==52)
				{
					Starling.juggler.remove(RSPMovie);
					removeChild(RSPMovie);
					RSPMovie.dispose();
					RSPMovie=null;
					removeChild(sunVaseImg);
					sunVaseImg.dispose();
					sunVaseImg=null;
					addChild(sunVase);
					sunVase.x=55.15;
					sunVase.y=12.1;
					//addChild(new Sun_Drop());
					removeEventListener(Event.ENTER_FRAME,WaitRSP);
					addEventListener(Event.ENTER_FRAME,onEnterframe);
					Cardinit();
				}
				c++;
			}
		}
		public var CardSeat1:DisplayObject=null;
		public var CardSeat2:DisplayObject=null;
		public var CardSeat3:DisplayObject=null;
		public var CardSeat4:DisplayObject=null;
		public var CardSeat5:DisplayObject=null;
		public var CardSeat6:DisplayObject=null;
		public var CardSeat7:DisplayObject=null;
		public var CardSeat8:DisplayObject=null;
		public var CardSeat9:DisplayObject=null;
		public function LockedCardinit():void
		{
			if(!bNeedToLockPlantCards)
				return;
			var Cardx:uint=152;
			i=1;
			if(uiCardNumber>=i)
			{
				CardSeat1 = new Image(Assets.getTexture("LockedCard"));
				addChild(CardSeat1);
				CardSeat1.x=Cardx;
				CardSeat1.y=4;
				Cardx+=66;
			}
			i++;
			if(uiCardNumber>=i)
			{
				CardSeat2=new Image(Assets.getTexture("LockedCard"));
				addChild(CardSeat2);
				CardSeat2.x=Cardx;
				CardSeat2.y=4;
				Cardx+=66;
			}
			i++;
			if(uiCardNumber>=i)
			{
				CardSeat3=new Image(Assets.getTexture("LockedCard"));
				addChild(CardSeat3);
				CardSeat3.x=Cardx;
				CardSeat3.y=4;
				Cardx+=66;
			}
			i++;
			if(uiCardNumber>=i)
			{
				CardSeat4=new Image(Assets.getTexture("LockedCard"));
				addChild(CardSeat4);
				CardSeat4.x=Cardx;
				CardSeat4.y=4;
				Cardx+=66;
			}
			i++;
			if(uiCardNumber>=i)
			{
				CardSeat5=new Image(Assets.getTexture("LockedCard"));
				addChild(CardSeat5);
				CardSeat5.x=Cardx;
				CardSeat5.y=4;
				Cardx+=66;
			}
			i++;
			if(uiCardNumber>=i)
			{
				CardSeat6=new Image(Assets.getTexture("LockedCard"));
				addChild(CardSeat6);
				CardSeat6.x=Cardx;
				CardSeat6.y=4;
				Cardx+=66;
			}
			i++;
			if(uiCardNumber>=i)
			{
				CardSeat7=new Image(Assets.getTexture("LockedCard"));
				addChild(CardSeat7);
				CardSeat7.x=Cardx;
				CardSeat7.y=4;
				Cardx+=66;
			}
			i++;
			if(uiCardNumber>=i)
			{
				CardSeat8=new Image(Assets.getTexture("LockedCard"));
				addChild(CardSeat8);
				CardSeat8.x=Cardx;
				CardSeat8.y=4;
				Cardx+=66;
			}
			i++;
			if(uiCardNumber>=i)
			{
				CardSeat9=new Image(Assets.getTexture("LockedCard"));
				addChild(CardSeat9);
				CardSeat9.x=Cardx;
				CardSeat9.y=4;
				Cardx+=66;
			}
			i++;
		}
		public function Cardinit():void
		{
			var Cardx:uint=152;
			i=1;
			if(uiCardNumber>=i)
			{
				if(bNeedToLockPlantCards&&CardSeat1!=null)
				{
					removeChild(CardSeat1);
					CardSeat1.dispose();
				}
				CardSeat1=new Card(cardCodeList[0],1);
				addChild(CardSeat1);
				CardSeat1.x=Cardx;
				CardSeat1.y=4;
				Cardx+=66;
			}i++;
			if(uiCardNumber>=i)
			{
				if(bNeedToLockPlantCards&&CardSeat2!=null)
				{
					removeChild(CardSeat2);CardSeat2.dispose();
				}
				CardSeat2=new Card(cardCodeList[1],2);
				addChild(CardSeat2);
				CardSeat2.x=Cardx;
				CardSeat2.y=4;
				Cardx+=66;
			}
			i++;
			if(uiCardNumber>=i)
			{
				if(bNeedToLockPlantCards&&CardSeat3!=null)
				{
					removeChild(CardSeat3);
					CardSeat3.dispose();
				}
				CardSeat3=new Card(cardCodeList[2],3);
				addChild(CardSeat3);
				CardSeat3.x=Cardx;
				CardSeat3.y=4;
				Cardx+=66;
			}
			i++;
			if(uiCardNumber>=i)
			{
				if(bNeedToLockPlantCards&&CardSeat4!=null)
				{
					removeChild(CardSeat4);
					CardSeat4.dispose();
				}
				CardSeat4=new Card(cardCodeList[3],4);
				addChild(CardSeat4);
				CardSeat4.x=Cardx;
				CardSeat4.y=4;
				Cardx+=66;
			}
			i++;
			if(uiCardNumber>=i)
			{
				if(bNeedToLockPlantCards&&CardSeat5!=null)
				{
					removeChild(CardSeat5);
					CardSeat5.dispose();
				}
				CardSeat5=new Card(cardCodeList[4],5);
				addChild(CardSeat5);
				CardSeat5.x=Cardx;
				CardSeat5.y=4;
				Cardx+=66;
			}
			i++;
			if(uiCardNumber>=i)
			{
				if(bNeedToLockPlantCards&&CardSeat6!=null)
				{
					removeChild(CardSeat6);
					CardSeat6.dispose();
				}
				CardSeat6=new Card(cardCodeList[5],6);
				addChild(CardSeat6);
				CardSeat6.x=Cardx;
				CardSeat6.y=4;
				Cardx+=66;
			}
			i++;
			if(uiCardNumber>=i)
			{
				if(bNeedToLockPlantCards&&CardSeat7!=null)
				{
					removeChild(CardSeat7);
					CardSeat7.dispose();
				}
				CardSeat7=new Card(cardCodeList[6],7);
				addChild(CardSeat7);
				CardSeat7.x=Cardx;
				CardSeat7.y=4;
				Cardx+=66;
			}
			i++;
			if(uiCardNumber>=i)
			{
				if(bNeedToLockPlantCards&&CardSeat8!=null)
				{
					removeChild(CardSeat8);
					CardSeat8.dispose();
				}
				CardSeat8=new Card(cardCodeList[7],8);
				addChild(CardSeat8);
				CardSeat8.x=Cardx;
				CardSeat8.y=4;
				Cardx+=66;
			}
			i++;
			if(uiCardNumber>=i)
			{
				if(bNeedToLockPlantCards&&CardSeat9!=null)
				{
					removeChild(CardSeat9);
					CardSeat9.dispose();
				}
				CardSeat9=new Card(cardCodeList[8],9);
				addChild(CardSeat9);
				CardSeat9.x=Cardx;
				CardSeat9.y=4;
				Cardx+=66;
			}
			i++;
		}
		public function Level1_Enterframe(event:Event):void
		{
	        DropSunJudge();
			chaseMousePlantsf();
			ReadyImagePut();
		}
		public function onEnterframe(event:Event):void
		{
			
			var c:uint = 0;
			while(c < speed)
			{
				if(uiBeginSunWith!=-1)
					DropSunJudge();
				chaseMousePlantsf();
				ReadyImagePut();
				LevelContinue();
				c++;
			}
		}
		public var SpecialLevels:String = "";
		public var pauseButton:MButton;
		public var speedButton:MButton;
		public var slowButton:MButton;
		public var Suns:Array=new Array;
		public var SunCapacity:uint=0;
		public var ifDropSunInit:Boolean=false;
		public var DropSunCount:uint=30;
		public var Level1_IfShowedTip4:Boolean = false;
		public var ShovelButton:MButton;
		public var ShovelItem:MButton;
		public function DropSunJudge():void
		{
			if(this.speed == 0){return;}
			if(!ifDropSunInit)
			{
				ifDropSunInit=true;
				Suns[0]=null;
				if(SpecialLevels != "Level1")
				{
					if((uiAbleLines>>4)==1)
					{
						arrLine[0]=new Lines(173.6);
						addChild(arrLine[0]);
					}
					else
						arrLine[0]=null;
					if(((uiAbleLines>>3)%2)==1)
					{
						arrLine[1]=new Lines(255);
						addChild(arrLine[1]);
					}
					else
						arrLine[1]=null;
					if(((uiAbleLines>>2)%2)==1)
					{
						arrLine[2]=new Lines(337);
						addChild(arrLine[2]);
					}
					else
						arrLine[2]=null;
					if(((uiAbleLines>>1)%2)==1)
					{
						arrLine[3]=new Lines(425);
						addChild(arrLine[3]);
					}
					else
						arrLine[3]=null;
					if((uiAbleLines%2)==1)
					{
						arrLine[4]=new Lines(504);
						addChild(arrLine[4]);
					}
					else
						arrLine[4]=null;
					addChild(touchToPlant);
					speedButton = new MButton(Assets.getTexture("SpeedUpState"),new Image(Assets.getTexture("SpeedDownState")),new Image(Assets.getTexture("SpeedOnState")),3);
					pauseButton = new MButton(Assets.getTexture("PauseUpState"),new Image(Assets.getTexture("PauseDownState")),new Image(Assets.getTexture("PauseOnState")),2);
					slowButton = new MButton(Assets.getTexture("SlowUpState"),new Image(Assets.getTexture("SlowDownState")),new Image(Assets.getTexture("SlowOnState")),3);
					addChild(pauseButton);
					pauseButton.x = 723;
					pauseButton.y = 7;
					//addChild(speedButton);
					speedButton.x = 652;
					speedButton.y = 7;
					//addChild(slowButton);
					slowButton.x = 652;
					slowButton.y = 7;
					slowButton.visible = false;
					if(bIfneedtoShovel == true)
					{
						ShovelItem = new MButton(Assets.getTexture("Shovel"),new Image(Assets.getTexture("Shovel")),new Image(Assets.getTexture("Shovel")),4);
						ShovelButton = new MButton(Assets.getTexture("ShovelContainer"),new Image(Assets.getTexture("ShovelContainer")),new Image(Assets.getTexture("ShovelContainer")),4);
						addChild(ShovelButton);
						ShovelButton.x = 10;
						ShovelButton.y = 523;
						addChild(ShovelItem);
						ShovelItem.x = 22.2;
						ShovelItem.y = 535;
						ShovelButtonwidth = ShovelItem.width;
						ShovelButtonheight = ShovelItem.height;
					}
				}
				//arrLine[0].AddZombie(1,818,54);
				//for(var i=0;i<5;i++)
				//{
				//DropSunStore[i]=new LevelPublic_Sun_Drop_Flash;
				//addChild(DropSunStore[i]);
				//}
				return;
			}
			DropSunCount++;
			if(DropSunCount==156)
			{
				//trace(arrLine[2].SpecialLevels);
				if(SpecialLevels == "Level1" && !Level1_IfShowedTip4)
				{
					arrLine[2].Level1_Tip4();
				}
				DropSunCount=0;
				var IPS:Boolean=false;
				for(var i:uint=0;i<=SunCapacity;i++)
				{
					if(Suns[i]==null)
					{
						Suns[i]=new Sun_Drop(i);
						addChild(Suns[i]);
						Suns[i].Drop();
						IPS=true;
						break;
					}
				}
				if(!IPS)
				{
					SunCapacity++;
					Suns[SunCapacity]=new Sun_Drop(SunCapacity);
					addChild(Suns[SunCapacity]);
					Suns[SunCapacity].Drop();
				}
			}
		}
		public function clearSun(Number:int,Energy:uint):void
		{
			if(Number!=-1)
			{
				removeChild(Suns[Number]);
				Suns[Number].dispose();
				Suns[Number]=null;
			}
			sunVase.TakeEnergy(Energy);
		}
		public function chaseMousePlantsf():void
		{
			//MouseChasePlant.gotoAndStop(PlantNum);
			//trace("Chasing...")
			//trace(parent.MouseX);
			//trace(parent.MouseY);
			if(imgMousePhasePlant1==null)
				return;
			imgMousePhasePlant1.x=parent.MouseX-50;
			imgMousePhasePlant1.y=parent.MouseY-50;
			imgMousePhasePlant2.x=parent.MouseX-3;
			imgMousePhasePlant2.y=parent.MouseY-50;
			imgMousePhasePlant3.x=parent.MouseX-50;
			imgMousePhasePlant3.y=parent.MouseY+3;
			imgMousePhasePlant4.x=parent.MouseX+3;
			imgMousePhasePlant4.y=parent.MouseY-3;
		}//_+_+_+_+_+_+_+
		public var Paused:Boolean = false;
		public static function stopAllMc(_con:DisplayObject):void
		{
			var child:DisplayObject; 
			
			if(_con is MovieClip)
			{
				var m:MovieClip=_con as MovieClip;
				m.pause();
				//trace(m.name,"stoped");
			}         
			if(_con is DisplayObjectContainer)
			{
				var con:DisplayObjectContainer=_con as DisplayObjectContainer;
				var s:int=con.numChildren;
				while((s--)>0)
				{    
					child = con.getChildAt(s); 
					stopAllMc(child);              
				}
			}
		}
		public static function playAllMc(_con:DisplayObject):void
		{
			var child:DisplayObject; 
			
			if(_con is MovieClip)
			{
				var m:MovieClip=_con as MovieClip;
				m.play();
				//trace(m.name,"stoped");
			}         
			if(_con is DisplayObjectContainer)
			{
				var con:DisplayObjectContainer=_con as DisplayObjectContainer;
				var s:int=con.numChildren;
				while((s--)>0)
				{    
					child = con.getChildAt(s); 
					playAllMc(child);              
				}
			}
		}
		public static function speedAllMc(_con:DisplayObject):void
		{
			var child:DisplayObject; 
			
			if(_con is MovieClip)
			{
				var m:MovieClip=_con as MovieClip;
				if(m.isPlaying){m.fps*=2;trace(m.name+' '+String(m.fps));}
				
				//trace(m.name,"stoped");
			}                 
			if(_con is Plant || _con is Zombie)
			{
				_con.Extrafps *= 2;
			} 
			if(_con is DisplayObjectContainer)
			{
				var con:DisplayObjectContainer=_con as DisplayObjectContainer;
				var s:int=con.numChildren;
				while((s--)>0)
				{    
					child = con.getChildAt(s); 
					speedAllMc(child);              
				}
			}
		}
		public static function slowAllMc(_con:DisplayObject):void
		{
			var child:DisplayObject; 
			
			if(_con is MovieClip)
			{
				var m:MovieClip=_con as MovieClip;
				if(m.isPlaying){m.fps/=2;trace(m.name+' '+String(m.fps));}
				//trace(m.name,"stoped");
			}         
			if(_con is Plant || _con is Zombie)
			{
				_con.Extrafps /= 2;
			}
			if(_con is DisplayObjectContainer)
			{
				var con:DisplayObjectContainer=_con as DisplayObjectContainer;
				var s:int=con.numChildren;
				while((s--)>0)
				{    
					child = con.getChildAt(s); 
					slowAllMc(child);              
				}
			}
		}
		/*
		public static function speedAllMc(_con:DisplayObject):void
		{
			var child:DisplayObject; 
			
			if(_con is MovieClip)
			{
				var m:MovieClip=_con as MovieClip;
				m.pause();
				//trace(m.name,"stoped");
			}         
			if(_con is DisplayObjectContainer)
			{
				var con:DisplayObjectContainer=_con as DisplayObjectContainer;
				var s:int=con.numChildren;
				while((s--)>0)
				{    
					child = con.getChildAt(s); 
					speedAllMc(child);              
				}
			}
		}*/
		public function onlyReadyImagePut(event:Event):void
		{
			chaseMousePlantsf();
			ReadyImagePut();
			trace(iPlantNum);
		}
		public var Sspeed:uint = 1;
		public var bAddedonlyReadyImagePut:Boolean = false;
		public var bIfCollectedShovel:Boolean = false;
		public var ShovelButtonwidth:Number;
		public var ShovelButtonheight:Number;
		public function MovingShovel(e:Event):void
		{
			ShovelItem.x = parent.MouseX - (ShovelButtonwidth/2);
			ShovelItem.y = parent.MouseY - (ShovelButtonheight/2);
			ShovelJudge();
		}
		public function SJ(a:int,b:int):void
		{
			arrLine[a].Plants[b].bIfShoveled = 1;
			arrLine[a].Plants[b].prebIfShoveled = 2;
		}
		public function ShovelJudge():void
		{
			var xx:int=parent.MouseX;
			var yy:int=parent.MouseY;
			if(yy >= 140.9 && yy <= 176.9)
			{
				if(arrLine[0]==null)
					return;
				if(xx>=150.3&&xx<=186.6){if(arrLine[0].Plants[0]==null){return;}SJ(0,0);}
				else if(xx>=224.3&&xx<=260.6){if(arrLine[0].Plants[1]==null){return;}SJ(0,1);}
				else if(xx>=295.3&&xx<=331.6){if(arrLine[0].Plants[2]==null){return;}SJ(0,2);}
				else if(xx>=364.3&&xx<=401.6){if(arrLine[0].Plants[3]==null){return;}SJ(0,3);}
				else if(xx>=437.3&&xx<=473.6){if(arrLine[0].Plants[4]==null){return;}SJ(0,4);}
				else if(xx>=505.3&&xx<=541.6){if(arrLine[0].Plants[5]==null){return;}SJ(0,5);}
				else if(xx>=573.3&&xx<=610.6){if(arrLine[0].Plants[6]==null){return;}SJ(0,6);}
				else if(xx>=644.3&&xx<=681.6){if(arrLine[0].Plants[7]==null){return;}SJ(0,7);}
				else if(xx>=714.3&&xx<=750.6){if(arrLine[0].Plants[8]==null){return;}SJ(0,8);}
			}
			else if(yy>=222.3&&yy<=258.3)
			{
				if(arrLine[1]==null)
					return;
				if(xx>=150.3&&xx<=186.6){if(arrLine[1].Plants[0]==null){return;}SJ(1,0);}
				else if(xx>=224.3&&xx<=260.6){if(arrLine[1].Plants[1]==null){return;}SJ(1,1);}
				else if(xx>=295.3&&xx<=331.6){if(arrLine[1].Plants[2]==null){return;}SJ(1,2);}
				else if(xx>=364.3&&xx<=401.6){if(arrLine[1].Plants[3]==null){return;}SJ(1,3);}
				else if(xx>=437.3&&xx<=473.6){if(arrLine[1].Plants[4]==null){return;}SJ(1,4);}
				else if(xx>=505.3&&xx<=541.6){if(arrLine[1].Plants[5]==null){return;}SJ(1,5);}
				else if(xx>=573.3&&xx<=610.6){if(arrLine[1].Plants[6]==null){return;}SJ(1,6);}
				else if(xx>=644.3&&xx<=681.6){if(arrLine[1].Plants[7]==null){return;}SJ(1,7);}
				else if(xx>=714.3&&xx<=750.6){if(arrLine[1].Plants[8]==null){return;}SJ(1,8);}
			}
			else if(yy>=308.3&&yy<=351.25)
			{
				if(arrLine[2]==null)
					return;
				if(xx>=150.3&&xx<=186.6){if(arrLine[2].Plants[0]==null){return;}SJ(2,0);}
				else if(xx>=224.3&&xx<=260.6){if(arrLine[2].Plants[1]==null){return;}SJ(2,1);}
				else if(xx>=295.3&&xx<=331.6){if(arrLine[2].Plants[2]==null){return;}SJ(2,2);}
				else if(xx>=364.3&&xx<=401.6){if(arrLine[2].Plants[3]==null){return;}SJ(2,3);}
				else if(xx>=437.3&&xx<=473.6){if(arrLine[2].Plants[4]==null){return;}SJ(2,4);}
				else if(xx>=505.3&&xx<=541.6){if(arrLine[2].Plants[5]==null){return;}SJ(2,5);}
				else if(xx>=573.3&&xx<=610.6){if(arrLine[2].Plants[6]==null){return;}SJ(2,6);}
				else if(xx>=644.3&&xx<=681.6){if(arrLine[2].Plants[7]==null){return;}SJ(2,7);}
				else if(xx>=714.3&&xx<=750.6){if(arrLine[2].Plants[8]==null){return;}SJ(2,8);}
			}
			else if(yy>=387.2&&yy<=423.2)
			{
				if(arrLine[3]==null)
					return;
				if(xx>=150.3&&xx<=186.6){if(arrLine[3].Plants[0]==null){return;}SJ(3,0);}
				else if(xx>=224.3&&xx<=260.6){if(arrLine[3].Plants[1]==null){return;}SJ(3,1);}
				else if(xx>=295.3&&xx<=331.6){if(arrLine[3].Plants[2]==null){return;}SJ(3,2);}
				else if(xx>=364.3&&xx<=401.6){if(arrLine[3].Plants[3]==null){return;}SJ(3,3);}
				else if(xx>=437.3&&xx<=473.6){if(arrLine[3].Plants[4]==null){return;}SJ(3,4);}
				else if(xx>=505.3&&xx<=541.6){if(arrLine[3].Plants[5]==null){return;}SJ(3,5);}
				else if(xx>=573.3&&xx<=610.6){if(arrLine[3].Plants[6]==null){return;}SJ(3,6);}
				else if(xx>=644.3&&xx<=681.6){if(arrLine[3].Plants[7]==null){return;}SJ(3,7);}
				else if(xx>=714.3&&xx<=750.6){if(arrLine[3].Plants[8]==null){return;}SJ(3,8);}
			}
			else if(yy>=473.2&&yy<=509.2)
			{
				if(arrLine[4]==null)
					return;
				if(xx>=150.3&&xx<=186.6){if(arrLine[4].Plants[0]==null){return;}SJ(4,0);}
				else if(xx>=224.3&&xx<=260.6){if(arrLine[4].Plants[1]==null){return;}SJ(4,1);}
				else if(xx>=295.3&&xx<=331.6){if(arrLine[4].Plants[2]==null){return;}SJ(4,2);}
				else if(xx>=364.3&&xx<=401.6){if(arrLine[4].Plants[3]==null){return;}SJ(4,3);}
				else if(xx>=437.3&&xx<=473.6){if(arrLine[4].Plants[4]==null){return;}SJ(4,4);}
				else if(xx>=505.3&&xx<=541.6){if(arrLine[4].Plants[5]==null){return;}SJ(4,5);}
				else if(xx>=573.3&&xx<=610.6){if(arrLine[4].Plants[6]==null){return;}SJ(4,6);}
				else if(xx>=644.3&&xx<=681.6){if(arrLine[4].Plants[7]==null){return;}SJ(4,7);}
				else if(xx>=714.3&&xx<=750.6){if(arrLine[4].Plants[8]==null){return;}SJ(4,8);}
			}
		}
		public var bIfShovelPlants:Boolean = false;
		public function DP(a:int,b:int):void
		{
			//trace("Ridiculous!");
			removeChild(arrLine[a].Plants[b]);
			arrLine[a].Plants[b].dispose();
			arrLine[a].Plants[b] = null;
			bIfCollectedShovel = false;
			ShovelItem.x = 22.2;
			ShovelItem.y = 535;
			removeEventListener(Event.ENTER_FRAME,MovingShovel);
			bIfShovelPlants = true;
			return;
		}
		public function ShovePlants():void
		{
			
			var xx:int=parent.MouseX;
			var yy:int=parent.MouseY;
			if(yy >= 140.9 && yy <= 176.9)
			{
				if(arrLine[0]==null)
					return;
				if(xx>=150.3&&xx<=186.6){if(arrLine[0].Plants[0]==null){return;}DP(0,0);}
				else if(xx>=224.3&&xx<=260.6){if(arrLine[0].Plants[1]==null){return;}DP(0,1);}
				else if(xx>=295.3&&xx<=331.6){if(arrLine[0].Plants[2]==null){return;}DP(0,2);}
				else if(xx>=364.3&&xx<=401.6){if(arrLine[0].Plants[3]==null){return;}DP(0,3);}
				else if(xx>=437.3&&xx<=473.6){if(arrLine[0].Plants[4]==null){return;}DP(0,4);}
				else if(xx>=505.3&&xx<=541.6){if(arrLine[0].Plants[5]==null){return;}DP(0,5);}
				else if(xx>=573.3&&xx<=610.6){if(arrLine[0].Plants[6]==null){return;}DP(0,6);}
				else if(xx>=644.3&&xx<=681.6){if(arrLine[0].Plants[7]==null){return;}DP(0,7);}
				else if(xx>=714.3&&xx<=750.6){if(arrLine[0].Plants[8]==null){return;}DP(0,8);}
			}
			else if(yy>=222.3&&yy<=258.3)
			{
				if(arrLine[1]==null)
					return;
				if(xx>=150.3&&xx<=186.6){if(arrLine[1].Plants[0]==null){return;}DP(1,0);}
				else if(xx>=224.3&&xx<=260.6){if(arrLine[1].Plants[1]==null){return;}DP(1,1);}
				else if(xx>=295.3&&xx<=331.6){if(arrLine[1].Plants[2]==null){return;}DP(1,2);}
				else if(xx>=364.3&&xx<=401.6){if(arrLine[1].Plants[3]==null){return;}DP(1,3);}
				else if(xx>=437.3&&xx<=473.6){if(arrLine[1].Plants[4]==null){return;}DP(1,4);}
				else if(xx>=505.3&&xx<=541.6){if(arrLine[1].Plants[5]==null){return;}DP(1,5);}
				else if(xx>=573.3&&xx<=610.6){if(arrLine[1].Plants[6]==null){return;}DP(1,6);}
				else if(xx>=644.3&&xx<=681.6){if(arrLine[1].Plants[7]==null){return;}DP(1,7);}
				else if(xx>=714.3&&xx<=750.6){if(arrLine[1].Plants[8]==null){return;}DP(1,8);}
			}
			else if(yy>=308.3&&yy<=351.25)
			{
				if(arrLine[2]==null)
					return;
				if(xx>=150.3&&xx<=186.6){if(arrLine[2].Plants[0]==null){return;}DP(2,0);}
				else if(xx>=224.3&&xx<=260.6){if(arrLine[2].Plants[1]==null){return;}DP(2,1);}
				else if(xx>=295.3&&xx<=331.6){if(arrLine[2].Plants[2]==null){return;}DP(2,2);}
				else if(xx>=364.3&&xx<=401.6){if(arrLine[2].Plants[3]==null){return;}DP(2,3);}
				else if(xx>=437.3&&xx<=473.6){if(arrLine[2].Plants[4]==null){return;}DP(2,4);}
				else if(xx>=505.3&&xx<=541.6){if(arrLine[2].Plants[5]==null){return;}DP(2,5);}
				else if(xx>=573.3&&xx<=610.6){if(arrLine[2].Plants[6]==null){return;}DP(2,6);}
				else if(xx>=644.3&&xx<=681.6){if(arrLine[2].Plants[7]==null){return;}DP(2,7);}
				else if(xx>=714.3&&xx<=750.6){if(arrLine[2].Plants[8]==null){return;}DP(2,8);}
			}
			else if(yy>=387.2&&yy<=423.2)
			{
				if(arrLine[3]==null)
					return;
				if(xx>=150.3&&xx<=186.6){if(arrLine[3].Plants[0]==null){return;}DP(3,0);}
				else if(xx>=224.3&&xx<=260.6){if(arrLine[3].Plants[1]==null){return;}DP(3,1);}
				else if(xx>=295.3&&xx<=331.6){if(arrLine[3].Plants[2]==null){return;}DP(3,2);}
				else if(xx>=364.3&&xx<=401.6){if(arrLine[3].Plants[3]==null){return;}DP(3,3);}
				else if(xx>=437.3&&xx<=473.6){if(arrLine[3].Plants[4]==null){return;}DP(3,4);}
				else if(xx>=505.3&&xx<=541.6){if(arrLine[3].Plants[5]==null){return;}DP(3,5);}
				else if(xx>=573.3&&xx<=610.6){if(arrLine[3].Plants[6]==null){return;}DP(3,6);}
				else if(xx>=644.3&&xx<=681.6){if(arrLine[3].Plants[7]==null){return;}DP(3,7);}
				else if(xx>=714.3&&xx<=750.6){if(arrLine[3].Plants[8]==null){return;}DP(3,8);}
			}
			else if(yy>=473.2&&yy<=509.2)
			{
				if(arrLine[4]==null)
					return;
				if(xx>=150.3&&xx<=186.6){if(arrLine[4].Plants[0]==null){return;}DP(4,0);}
				else if(xx>=224.3&&xx<=260.6){if(arrLine[4].Plants[1]==null){return;}DP(4,1);}
				else if(xx>=295.3&&xx<=331.6){if(arrLine[4].Plants[2]==null){return;}DP(4,2);}
				else if(xx>=364.3&&xx<=401.6){if(arrLine[4].Plants[3]==null){return;}DP(4,3);}
				else if(xx>=437.3&&xx<=473.6){if(arrLine[4].Plants[4]==null){return;}DP(4,4);}
				else if(xx>=505.3&&xx<=541.6){if(arrLine[4].Plants[5]==null){return;}DP(4,5);}
				else if(xx>=573.3&&xx<=610.6){if(arrLine[4].Plants[6]==null){return;}DP(4,6);}
				else if(xx>=644.3&&xx<=681.6){if(arrLine[4].Plants[7]==null){return;}DP(4,7);}
				else if(xx>=714.3&&xx<=750.6){if(arrLine[4].Plants[8]==null){return;}DP(4,8);}
			}
		}
		public var Code:String;
		public function sendMessage(A):void
		{
			if(A==6)
			{
				getPrize();
				return;
			}
			if(A==7)
			{
				parent.NextLevel(Code);
				return;
			}
			if(A==8)
			{
				parent.Back();
				return;
			}
			if(A==4)
			{
				if(bIfCollectedShovel)
				{
					if(parent.MouseX >= 9.9 && parent.MouseX <= 64.2 && parent.MouseY >= 525.8 && parent.MouseY <= 590.2)
					{
					    bIfCollectedShovel = false;
						ShovelItem.x = 22.2;
						ShovelItem.y = 535;
					    removeEventListener(Event.ENTER_FRAME,MovingShovel);
					}
					ShovePlants();
					if(!bIfShovelPlants)
					{
						ShovelItem.x = 22.2;
						ShovelItem.y = 535;
						removeEventListener(Event.ENTER_FRAME,MovingShovel);
					}
				}
				else
				{
				    bIfCollectedShovel = true;
				    addEventListener(Event.ENTER_FRAME,MovingShovel);
				}
				return;
			}
			if(A==5)
			{
				if(bIfCollectedShovel)
				{
					bIfCollectedShovel = false;
					ShovelButton.x = 10;
					ShovelButton.y = 523;
					removeEventListener(Event.ENTER_FRAME,MovingShovel);
				}
				else
				{
					bIfCollectedShovel = true;
					addEventListener(Event.ENTER_FRAME,MovingShovel);
				}
				return;
			}
			if(A==2)
			{
				if(Paused)
				{this.speed = Sspeed;playAllMc(this);Paused = false;return;}
				speed = 0;
				stopAllMc(this);
				Paused = true;
				return;
			}
			if(A==3)
			{
                if(this.Sspeed==1){speedAllMc(this);speed=Sspeed=2;speedButton.visible = false;slowButton.visible = true;return;}
				if(this.Sspeed==2){slowAllMc(this);speed=Sspeed=1;slowButton.visible = false;speedButton.visible = true;}
				return;
			}
			switch(A[0])
			{
				case 1:
				{
					DPMCP();
					if(A[1]==this.iPlantNum)
					{
						iPlantNum=-1;
						return;
					}
					if(A[3] == true && !bAddedonlyReadyImagePut)
					{
						bAddedonlyReadyImagePut = true;
						addEventListener(Event.ENTER_FRAME,onlyReadyImagePut);
					}
					imgMousePhasePlant1=new Image(vecMousePhasePlant1[A[1]-1]);
					imgMousePhasePlant2=new Image(vecMousePhasePlant2[A[1]-1]);
					imgMousePhasePlant3=new Image(vecMousePhasePlant3[A[1]-1]);
					imgMousePhasePlant4=new Image(vecMousePhasePlant4[A[1]-1]);
					addChild(imgMousePhasePlant1);
					imgMousePhasePlant1.x=parent.MouseX-50;
					imgMousePhasePlant1.y=parent.MouseY-50;
					addChild(imgMousePhasePlant2);
					imgMousePhasePlant2.x=parent.MouseX-3;
					imgMousePhasePlant2.y=parent.MouseY-50;
					addChild(imgMousePhasePlant3);
					imgMousePhasePlant3.x=parent.MouseX-50;
					imgMousePhasePlant3.y=parent.MouseY+3;
					addChild(imgMousePhasePlant4);
					imgMousePhasePlant4.x=parent.MouseX+3;
					imgMousePhasePlant4.y=parent.MouseY-3;
					if(ReadyputImageofPlant!=null)
					{
						removeChild(ReadyputImageofPlant);
						ReadyputImageofPlant.dispose();
						ReadyputImageofPlant=null;
					}
					ReadyputImageofPlant=new Image(vecRIPPO[A[1]-1]);
					iPlantNum=(A[1]);
					uiCardNumberNow=A[2];
					addChild(ReadyputImageofPlant);
					ReadyputImageofPlant.alpha=0.5;
					//removeChild(touchToPlant);
					addChild(touchToPlant);
					if(this.bIfneedtoShovel)
					{
						removeChild(ShovelItem);
						addChild(ShovelItem);
					}
					break;
				}
				default:
				{
					throw new Error("Unknown massage is found by 'Level' and there isn't default value");
				}
			}
		}
	}
}