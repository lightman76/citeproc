Feature: sort
  As a CSL cite processor hacker
  I want the test sort_BibliographyCitationNumberDescending to pass

  @bibliography @sort
  Scenario: Bibliography Citation Number Descending
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
          <text value="bogus"/>
        </layout>
      </citation>
      <bibliography>
        <sort>
          <key variable="citation-number" sort="descending"/>
        </sort>
        <layout>
          <text variable="citation-number" prefix="[" suffix="] "/>
          <text variable="title" />
        </layout>
      </bibliography>
    </style>
    """
    And the following input:
    """
    [{"id":"item-1","title":"Book One","type":"book"},{"id":"item-3","title":"Book Three","type":"book"},{"id":"item-4","title":"Book Four","type":"book"},{"id":"item-6","title":"Book Six","type":"book"},{"id":"item-2","title":"Book Two","type":"book"},{"id":"item-5","title":"Book Five","type":"book"},{"id":"item-7","title":"Book Seven","type":"book"},{"id":"item-8","title":"Book Eight","type":"book"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry">[8] Book One</div>
      <div class="csl-entry">[7] Book Three</div>
      <div class="csl-entry">[6] Book Four</div>
      <div class="csl-entry">[5] Book Six</div>
      <div class="csl-entry">[4] Book Two</div>
      <div class="csl-entry">[3] Book Five</div>
      <div class="csl-entry">[2] Book Seven</div>
      <div class="csl-entry">[1] Book Eight</div>
    </div>
    """