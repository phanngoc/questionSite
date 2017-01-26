CKEDITOR.editorConfig = function (config) {
  // ... other configuration ...

  config.toolbar = "simple";

  config.toolbarGroups = [
  	{"name":"basicstyles","groups":["basicstyles"]},
	{"name":"links","groups":["links"]},
	{"name":"paragraph","groups":["list","blocks"]},
	{"name":"document","groups":["mode"]},
	{"name":"insert","groups":["insert"]},
	{"name":"styles","groups":["styles"]},
	{"name":"about","groups":["about"]}
  ],

  config.removeButtons = 'Underline,Strike,Subscript,Superscript,Anchor,Styles,Specialchar,Flash,New Page,Print'
  // ... rest of the original config.js  ...
}