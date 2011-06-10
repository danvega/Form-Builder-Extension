/**
 *
 */
component {

	public RDSParser function init(){
		return this;
	}

	public struct function parse(Xml event){
		var rds = {};
		rds.database = getDatabase(event);
		rds.tables = getTables(arguments.event);
		return rds;
	}

	private string function getDatabase(Xml event){
		return xmlSearch(arguments.event,"//database/@name")[1].XmlValue;
	}

	private array function getTables(Xml event){
		var tableList = arrayNew(1);
		var tables = xmlSearch(arguments.event,"//table");

		for(i=1; i <= arrayLen(tables); ++i){
			var tableName = replace(tables[i].XmlAttributes.name,"dbo.","");
			var temp = {};
			temp.name = tableName;
			temp.columns = arrayNew(1);

			var fields = xmlSearch(arguments.event,"//table[#i#]//fields/field");
			for(j=1; j <= arrayLen(fields); ++j){
				arrayAppend(temp.columns,fields[j].XmlAttributes);
			}
			arrayAppend(tableList,temp);
		}

		return tableList;
	}
}