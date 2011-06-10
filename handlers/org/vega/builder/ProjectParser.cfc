/**
 *
 */
component {

	public ProjectParser function init(){
		return this;
	}

	public struct function parse(Xml event){
		var project = {};
		project.name = getProjectName(arguments.event);
		project.location = getProjectLocation(arguments.event);
		project.resourcePath = getResourcePath(arguments.event);
		project.resourceType = getResourceType(arguments.event);
		return project;
	}

	private string function getProjectName(Xml event){
		return xmlSearch(arguments.event,"//projectview/@projectname")[1].XmlValue;
	}

	private string function getProjectLocation(Xml event){
		return xmlSearch(arguments.event,"//projectview/@projectlocation")[1].XmlValue;
	}

	private string function getResourcePath(Xml event){
		return xmlSearch(arguments.event,"//projectview/resource/@path")[1].XmlValue;
	}

	private string function getResourceType(Xml event){
		return xmlSearch(arguments.event,"//projectview/resource/@type")[1].XmlValue;
	}

}