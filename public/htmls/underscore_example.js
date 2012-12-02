<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>Looking At Underscore.js Templates</title>
</head>
<body>

	<h1>
		Looking At Underscore.js Templates
	</h1>


	<!-- BEGIN: Underscore Template Definition. -->
	<script type="text/template" class="template">

		<h2>
			<%- rc.listTitle %>
		</h2>

		<ul>
			<% _.each( rc.listItems, function( listItem ){ %>

				<li>

					<%- listItem.name %>

					<% if ( listItem.hasOlympicGold ){ %>
						<em>*</em>
					<% } %>

				</li>

			<% }); %>
		</ul>


		<% var showFootnote = _.any(
			_.pluck( rc.listItems, "hasOlympicGold" )
		); %>


		<% if ( showFootnote ){ %>

			<p style="font-size: 12px ;">

				<em>* Olympic gold medalist</em>

			</p>

		<% } %>

	</script>
	<!-- END: Underscore Template Definition. -->


	<!-- Include and run scripts. -->
	
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
  <script src="http://ajax.cdnjs.com/ajax/libs/json2/20110223/json2.js"></script>
  <script src="http://ajax.cdnjs.com/ajax/libs/underscore.js/1.1.6/underscore-min.js"></script>
  <script src="http://ajax.cdnjs.com/ajax/libs/backbone.js/0.3.3/backbone-min.js"></script>


	<script type="text/javascript">


		// When rending an underscore template, we want top-level
		// variables to be referenced as part of an object. For
		// technical reasons (scope-chain search), this speeds up
		// rendering; however, more importantly, this also allows our
		// templates to look / feel more like our server-side
		// templates that use the rc (Request Context / Colletion) in
		// order to render their markup.
		_.templateSettings.variable = "rc";

		// Grab the HTML out of our template tag and pre-compile it.
		var template = _.template(
			$( "script.template" ).html()
		);

		// Define our render data (to be put into the "rc" variable).
		var templateData = {
			listTitle: "Olympic Volleyball Players",
			listItems: [
				{
					name: "Misty May-Treanor",
					hasOlympicGold: true
				},
				{
					name: "Kerri Walsh Jennings",
					hasOlympicGold: true
				},
				{
					name: "Jennifer Kessy",
					hasOlympicGold: false
				},
				{
					name: "April Ross",
					hasOlympicGold: false
				}
			]
		};

		// Render the underscore template and inject it after the H1
		// in our current DOM.
		$( "h1" ).after(
			template( templateData )
		);


	</script>
</body>
</html>
