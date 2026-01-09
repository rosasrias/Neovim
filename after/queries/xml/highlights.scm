;; ============================
;; XAML custom highlights
;; ============================

;; Tags: <Grid>, <Button>, </StackPanel>
(element
  (start_tag (tag_name) @tag)
  (end_tag (tag_name) @tag))

(self_closing_tag (tag_name) @tag)

;; Attributes: Width=, Height=, Background=
(attribute
  (attribute_name) @tag.attribute
  (quoted_attribute_value) @string)

;; Binding + markup extensions: {Binding}, {StaticResource}, etc
((text) @keyword
  (#match? @keyword "\\{[A-Za-z0-9: ]+\\}"))

;; Highlight xmlns="" declarations
(attribute
  (attribute_name) @namespace
  (#match? @namespace "^xmlns"))

(attribute
  (quoted_attribute_value) @string.special
  (#match? @string.special "clr-namespace"))
