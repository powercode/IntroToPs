function Get-RJTopSpeaker {
	param($Path, $count)

    ([xml](Get-Content -Raw $path)).Play.Act.Scene.Speech | Group Speaker | Sort Count -Descending | Select -first $count | Foreach {
        [pscustomobject] @{ Actor=$_.Name;SpeechCount = $_.Count; WordCount = ($_.Group | foreach {-split $_.Line} | Measure-Object).Count }
    }
}