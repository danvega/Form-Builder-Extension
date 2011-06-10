
<h1>Add Entry</h1>
<form name="frmentry" action="entry.cfm" method="POST" >
	<p>
		<label for="id">ID</label>
		<input type="text" id="id" name="id" value="#form.id#">
	</p>
	<p>
		<label for="title">title</label>
		<input type="text" id="title" name="title" value="#form.title#">
	</p>
	<p>
		<label for="body">body</label>
		<textarea name="body"></textarea>
	</p>
	<p>
		<label for="posted">posted</label>
		<input type="text" id="posted" name="posted" value="#form.posted#">
	</p>
	<p>
		<label for="morebody">more body</label>
		<textarea name="morebody"></textarea>
	</p>
	<p>
		<label for="username">username</label>
		<input type="text" id="username" name="username" value="#form.username#">
	</p>
	<p>
		<label for="blog">blog</label>
		<input type="text" id="blog" name="blog" value="#form.blog#">
	</p>
	<p>
		<label for="allowcomments">allow comments</label>
		<input type="text" id="allowcomments" name="allowcomments" value="#form.allowcomments#">
	</p>
	<p>
		<label for="enclosure">enclosure</label>
		<input type="text" id="enclosure" name="enclosure" value="#form.enclosure#">
	</p>
	<p>
		<label for="filesize">filesize</label>
		<input type="text" id="filesize" name="filesize" value="#form.filesize#">
	</p>
	<p>
		<label for="mimetype">mimetype</label>
		<input type="text" id="mimetype" name="mimetype" value="#form.mimetype#">
	</p>
	<p>
		<label for="views">views</label>
		<input type="text" id="views" name="views" value="#form.views#">
	</p>
	<p>
		<label for="released">released</label>
		<input type="text" id="released" name="released" value="#form.released#">
	</p>
	<p>
		<label for="mailed">mailed</label>
		<input type="text" id="mailed" name="mailed" value="#form.mailed#">
	</p>
	<p align="right">
		<input type="submit" name="submit" value="Save Entry">
	</p>
</form>

