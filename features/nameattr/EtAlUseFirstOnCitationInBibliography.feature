Feature: nameattr
  As a CSL cite processor hacker
  I want the test nameattr_EtAlUseFirstOnCitationInBibliography to pass

  @bibliography @nameattr
  Scenario: Et Al Use First On Citation In Bibliography
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
      <citation
          et-al-use-first="2">
        <layout>
          <names variable="author">
            <name et-al-min="3" delimiter=", "/>
          </names>
        </layout>
      </citation>
      <bibliography>
        <layout>
          <names variable="author">
            <name et-al-min="3" delimiter=", "/>
          </names>
        </layout>
      </bibliography>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Doe","given":"John"},{"family":"Roe","given":"Jane"},{"family":"Snoakes","given":"Richard"}],"id":"ITEM-1","type":"book"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry">John Doe et al.</div>
    </div>
    """
