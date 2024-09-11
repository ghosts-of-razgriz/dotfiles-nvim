((script_element
  (start_tag (tag_name) @start (#eq? @start "script"))
  (raw_text) @js
  (end_tag (tag_name) @end (#eq? @end "script")))

	@js (#set! js.language "javascript"))

