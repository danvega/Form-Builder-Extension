/**
 * @dispalyname Event Info Parser
 * @accessors true
 */
component {

	property eventInfo;

	public EventInfoParser function init(String event){
		this.setEventInfo(arguments.event);
		return this;
	}

	public any function parse(){
		var event = this.getEventInfo();
		var type = getContributionType(event);
		var eventXML = xmlparse(event);
		var response = "";

		switch(type){
			case "project" : {
				var parser = new ProjectParser();
				response = parser.parse(event);
				response.eventtype = "project";
				break;
			}
			case "rds" : {
				var parser = new RDSParser();
				response = parser.parse(event);
				response.eventtype = "rds";
				break;
			}
			case "outline" : {
				var parser = new OutlineParser();
				response = parser.parse(event);
				response.eventtype = "outline";
				break;
			}
		}

		// user input || install wizard
		if( find("<user>",this.getEventInfo()) ) {

			if(find("</page>",this.getEventInfo())){
				// install wizard
			} else {
				// user input
				var parser = new UserInputParser();
				response.user = parser.parse(event);
			}
		}

		// add the original event string to the response just in case we want to see it
		response.event = event;

		return response;
	}

	/**
	 * @hint I will determine the menu contribution type
	 */
	public string function getContributionType(){
		var event = this.getEventInfo();
		var type = "";

		if(find("rdsview",event)){
			type = "rds";
		}
		if(find("projectview",event)){
			type = "project";
		}
		if(find("outlineview",event)){
			type = "outline";
		}
		return type;
	}
}