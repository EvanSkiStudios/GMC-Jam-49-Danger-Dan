//array refs
#macro TContent 0
#macro TLoop 1
#macro TColor 2
#macro TFont 3
#macro TSprite 4
#macro TVoice 5
#macro TSpeed 6

//wrapper function that auto fills info
function ETW_Topic(text_num, settings_loop=false, text_color=c_white, text_sprite=-1, text_voice=-1, text_font=fnt_splash, text_speed=0.25){
		text[text_num][TLoop] = settings_loop;
		text[text_num][TColor] = text_color;
		text[text_num][TFont] = text_font;
		text[text_num][TSprite] = text_sprite;
		text[text_num][TVoice] = text_voice;
		text[text_num][TSpeed] = text_speed;
}


function ETW_texttopic(){
	//reset array
	text = undefined;
	var i = 0;
	
	//gets text language struct
	ETW_text_get_lang(global.ETW_Game_lang);
	
	switch(global.game_convo_number)
	{
		//error for somehow not knowing what game convo we are at
		default:{
			text[i][TContent] = "Text in array is not set for current convo number "+string(global.game_convo_number)+" !!";
			ETW_Topic(i,,c_orange,,,,1.0);
		}break;

		// default set text
		// text[i][TContent] = struct_name.string_ref_name;
		// call ETW_Topic with optinal arguments to customize text

		case Typewriter_text_ref.level_1_intro:{			
			text[i][TContent] = ETW_Text_lang.level_1_intro;
			ETW_Topic(i,,,,1,,);
		}break;
		
		case Typewriter_text_ref.level_1_outro:{			
			text[i][TContent] = ETW_Text_lang.level_1_outro;
			ETW_Topic(i,,,,1,,);
		}break;
		
		case Typewriter_text_ref.level_2_intro:{			
			text[i][TContent] = ETW_Text_lang.level_2_intro;
			ETW_Topic(i,,,,1,,);
		}break;
		
		case Typewriter_text_ref.level_2_outro:{			
			text[i][TContent] = ETW_Text_lang.level_2_outro;
			ETW_Topic(i,,,,1,,);
		}break;
		
		case Typewriter_text_ref.level_4_intro:{			
			text[i][TContent] = ETW_Text_lang.level_4_intro;
			ETW_Topic(i,,,,1,,);
			
			text[++i][TContent] = ETW_Text_lang.level_4_intro_2;
			ETW_Topic(i,,,,1,,);
			
			text[++i][TContent] = ETW_Text_lang.level_4_intro_3;
			ETW_Topic(i,,,,1,,);
		}break;
		
		case Typewriter_text_ref.level_4_outro:{			
			text[i][TContent] = ETW_Text_lang.level_4_outro;
			ETW_Topic(i,,,,1,,);
		}break;
		
		case Typewriter_text_ref.level_5_intro:{			
			text[i][TContent] = ETW_Text_lang.level_5_intro;
			ETW_Topic(i,,,,1,,);
		}break;
		
		case Typewriter_text_ref.level_5_outro:{			
			text[i][TContent] = ETW_Text_lang.level_5_outro;
			ETW_Topic(i,,,,1,,);
		}break;
		
		case Typewriter_text_ref.level_6_intro:{			
			text[i][TContent] = ETW_Text_lang.level_6_intro;
			ETW_Topic(i,,,,1,,);
			
			text[++i][TContent] = ETW_Text_lang.level_6_intro_2;
			ETW_Topic(i,,,,1,,);
			
			text[++i][TContent] = ETW_Text_lang.level_6_intro_3;
			ETW_Topic(i,,,,1,,);
		}break;
		
		case Typewriter_text_ref.level_6_outro:{			
			text[i][TContent] = ETW_Text_lang.level_6_outro;
			ETW_Topic(i,,,,1,,);
		}break;
		
		case Typewriter_text_ref.level_9_intro:{			
			text[i][TContent] = ETW_Text_lang.level_9_intro;
			ETW_Topic(i,,,,1,,);
			
			text[++i][TContent] = ETW_Text_lang.level_9_intro_2;
			ETW_Topic(i,,,,1,,);
			
			text[++i][TContent] = ETW_Text_lang.level_9_intro_3;
			ETW_Topic(i,,,,1,,);
			
			text[++i][TContent] = ETW_Text_lang.level_9_intro_4;
			ETW_Topic(i,,,,1,,);
		}break;
		
		case Typewriter_text_ref.level_11_outro:{			
			text[i][TContent] = ETW_Text_lang.level_11_outro;
			ETW_Topic(i,,,,1,,);
			
			text[++i][TContent] = ETW_Text_lang.level_11_outro_2;
			ETW_Topic(i,,,,1,,);
		}break;
	}
	
	//sets last array position to the length of the array
	//array length counts 0 as 1 so we remove 1 
	text_last = (array_length(text)-1);
}