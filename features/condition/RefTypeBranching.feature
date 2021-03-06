Feature: condition
  As a CSL cite processor hacker
  I want the test condition_RefTypeBranching to pass

  @bibliography @condition
  Scenario: Ref Type Branching
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
      <macro name="author">
        <names variable="author">
          <name />
        </names>
      </macro>
      <macro name="author-short">
        <names variable="author">
          <name form="short" />
        </names>
      </macro>
      <macro name="title">
        <choose>
          <if type="book">
            <text font-style="italic" variable="title" />
          </if>
          <else>
            <text variable="title" />
          </else>
        </choose>
      </macro>
      <citation>
        <layout delimiter="; " prefix="(" suffix=")">
          <group delimiter=", ">
            <group delimiter=" ">
              <text macro="author-short" />
              <date variable="issued" form="text" date-parts="year"/>
            </group>
            <group>
              <label form="short" suffix="." variable="locator" />
              <text variable="locator" />
            </group>
          </group>
        </layout>
      </citation>
      <bibliography>
        <layout>
          <choose>
            <if type="book">
              <group delimiter=" " suffix=".">
                <text macro="title" />
                <text macro="author" prefix="(" suffix=")," />
                <date variable="issued">
                  <date-part name="year" />
                </date>
              </group>
            </if>
            <else-if type="article">
              <group delimiter=" " suffix=".">
                <text macro="author" suffix="," />
                <date suffix="." variable="issued">
                  <date-part name="year" />
                </date>
                <text macro="title" />
              </group>
            </else-if>
            <else-if type="report">
              <group delimiter=" " suffix=".">
                <date suffix="." variable="issued">
                  <date-part name="year" />
                </date>
                <text macro="title" suffix="," />
                <text macro="author" />
              </group>
            </else-if>
            <else-if type="paper-conference">
              <group delimiter=" " suffix=".">
                <text macro="title" />
                <date prefix="(" suffix=")," variable="issued">
                  <date-part name="year" />
                </date>
                <text macro="author" />
              </group>
            </else-if>
            <else>
              <group delimiter=", " suffix=".">
                <text macro="title" />
                <text macro="author" />
                <date variable="issued">
                  <date-part name="year" />
                </date>
              </group>
            </else>
          </choose>
        </layout>
      </bibliography>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Doe","given":"John","static-ordering":false}],"id":"ITEM-1","issued":{"date-parts":[["2000"]]},"title":"Work 1","type":"book"},{"author":[{"family":"Doe","given":"John","static-ordering":false}],"id":"ITEM-2","issued":{"date-parts":[["2000"]]},"title":"Work 2","type":"article"},{"author":[{"family":"Doe","given":"John","static-ordering":false}],"id":"ITEM-3","issued":{"date-parts":[["2000"]]},"title":"Work 3","type":"report"},{"author":[{"family":"Doe","given":"John","static-ordering":false}],"id":"ITEM-4","issued":{"date-parts":[["2000"]]},"title":"Work 4","type":"paper-conference"},{"author":[{"family":"Doe","given":"John","static-ordering":false}],"id":"ITEM-5","issued":{"date-parts":[["2000"]]},"title":"Work 5","type":"chapter"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry"><i>Work 1</i> (John Doe), 2000.</div>
      <div class="csl-entry">John Doe, 2000. Work 2.</div>
      <div class="csl-entry">2000. Work 3, John Doe.</div>
      <div class="csl-entry">Work 4 (2000), John Doe.</div>
      <div class="csl-entry">Work 5, John Doe, 2000.</div>
    </div>
    """
