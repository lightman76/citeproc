Feature: name
  As a CSL cite processor hacker
  I want the test name_SubstituteOnNamesSpanNamesSpanFail to pass

  @citation @name
  Scenario: Substitute On Names Span Names Span Fail
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
          <names variable="translator">
            <name />
            <substitute>
              <names prefix="(" suffix=")" variable="author">
                <name />
              </names>
              <names variable="editor">
                <name />
              </names>
            </substitute>
          </names>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Doe","given":"John","static-ordering":false}],"edition":"5","editor":[{"family":"Roe","given":"Jane","static-ordering":false}],"id":"item-1","issued":{"date-parts":[["2000"]]},"title":"His Anonymous Life","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    (John Doe)
    """
