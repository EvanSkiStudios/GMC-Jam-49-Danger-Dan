function MARTE_TEXT_CONTAINER(){
//reset array
text = undefined;
var i = 0;


text[i][TContent] = "Hello, Welcome to the Gauss Magnetics Corporation, [EMPLOYEE_NAME_HERE]. Your goal is simple, Keep the GMC Reactor running at all times.";
ETW_Topic(i,,,,1,,);

text[++i][TContent] = "To maintain minimal level of  O.S.H.A compliant, we are required to explain the mechanics of your job and how to remain safe while doing so.";
ETW_Topic(i,,,,1,,);

text[++i][TContent] = "The reactor powers the whole facility and shall drain its fuel supply over time and thus need more fuel added periodically to keep functions running smoothly.";
ETW_Topic(i,,,,1,,);

text[++i][TContent] = "You will fuel the reactor with those shiny green rocks we import from the warehouse. Please note! These rocks while green, are highly radioactive and will slowly destroy your D.N.A if you prolong your exposure to said green rocks.";
ETW_Topic(i,,,,1,,);

text[++i][TContent] = "The reactor will also expose you to dangerous levels of radiation, thus you are advised to avoid it.";
ETW_Topic(i,,,,1,,);

text[++i][TContent] = "There is an O.S.H.A compliant Employee shower, available to scrub your yellow suit free of radioactive dust."
ETW_Topic(i,,,,1,,);

text[++i][TContent] = "Please note! Your yellow suit is of the minimal required level of protection as required by the O.S.H.A";
ETW_Topic(i,,,,1,,);

text[++i][TContent] = "That being said we are advised to warn nylon allergic employees, that the yellow suit is composed of 91.333333% FD&C Yellow No. 5 dyed nylon";
ETW_Topic(i,,,,1,,);

text[++i][TContent] = "Some of our green rocks are unstable and have become red rocks, AVOID FUELING THE REACTOR WITH THESE AT ALL COSTS, instead you should dispose of them in the Recycle Ginder.";
ETW_Topic(i,,,,1,,);

text[++i][TContent] = "The Grinder is powered by the reactor through the Energy Projection Magnetic Field Flux Poles, These poles operate on cycles, the Grinder is only safe to use when these cycles are in the powered off state.";
ETW_Topic(i,,,,1,,);

text[++i][TContent] = "The Boiler you see in the room is hot, we use it to pre-boil the water before sending it to the reactor to be boiled into steam to turn the turbine generators.";
ETW_Topic(i,,,,1,,);

text[++i][TContent] = "Most importantly!";
ETW_Topic(i,,,,1,,);

text[++i][TContent] = "DO NOT let the reactor run out of Fuel as it will enter a critical state.";
ETW_Topic(i,,,,1,,);

text[++i][TContent] = "Failure to follow these safety protocols will result in an painful death.";
ETW_Topic(i,,,,1,,);

text[++i][TContent] = "We believe you will perform your tasks with a 87.6395841259637% accuracy.";
ETW_Topic(i,,,,1,,);

text[++i][TContent] = "By being read these safety protocol procedures, you acknowledge that the Gauss Magnetics Corporation is not responsible for any harm, death, or resulting injury from your workplace environment, as reminded in your employee contract.";
ETW_Topic(i,,,,1,,);

text[++i][TContent] = "Thank you and have a very safe work day, that you can manage with 73.1415926158736957% accuracy.";
ETW_Topic(i,,,,1,,);

//sets last array position to the length of the array
//array length counts 0 as 1 so we remove 1 
text_last = (array_length(text)-1);
}