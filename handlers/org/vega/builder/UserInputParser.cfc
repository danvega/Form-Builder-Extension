/**
 * @displayname User Input Parser
 * @hint I will parse user input into a key/pair value structure
 */
component {

	public UserInputParser function init(){
		return this;
	}

	public struct function parse(Xml event){
		var user = {};
		var inputs = xmlSearch(arguments.event,"//user/input");

		for(i=1; i <= arrayLen(inputs); ++i){
			user["#inputs[i].XmlAttributes.name#"] = inputs[i].XmlAttributes.value;
		}

		return user;
	}

}