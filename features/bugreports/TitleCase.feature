Feature: bugreports
  As a CSL cite processor hacker
  I want the test bugreports_TitleCase to pass

  @citation @bugreports
  Scenario: Title Case
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
        <layout suffix=".">
          <text variable="title" text-case="title"/>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"id":"ITEM-1","title":"One but two or three yet four so five for six and seven nor eight a nine an ten the eleven at twelve by thirteen from fourteen in fifteen into sixteen of seventeen on eighteen to nineteen with twenty up twenty-one down twenty-two as twenty-three via twenty-four till twenty-five onto twenty-six over twenty-seven.","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    One but Two or Three yet Four so Five for Six and Seven nor Eight a Nine an Ten the Eleven at Twelve by Thirteen from Fourteen in Fifteen into Sixteen of Seventeen on Eighteen to Nineteen with Twenty up Twenty-One down Twenty-Two as Twenty-Three via Twenty-Four till Twenty-Five onto Twenty-Six over Twenty-Seven.
    """
