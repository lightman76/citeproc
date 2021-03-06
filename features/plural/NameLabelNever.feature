Feature: plural
  As a CSL cite processor hacker
  I want the test plural_NameLabelNever to pass

  @citation @plural
  Scenario: Name Label Never
    Given the following style:
    """
    <style 
          xmlns="http://purl.org/net/xbiblio/csl"
          class="note"
          version="1.0">
      <info>
        <id />
        <title />
        <updated>2009-08-10T04:49:00+09:00</updated>
      </info>
      <citation>
        <layout>
          <names variable="editor">
            <name and="text" form="short" suffix=" " />
            <label form="short" plural="never" strip-periods="true" />
          </names>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"editor":[{"family":"Doe","given":"John","static-ordering":false},{"family":"Roe","given":"Jane","static-ordering":false}],"id":"ITEM-1","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    Doe and Roe ed
    """
