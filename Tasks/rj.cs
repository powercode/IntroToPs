using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;
using System.Management.Automation;
using System.Text;


namespace RomeoJuliet
{
	public class ShakespeareStatistics
	{
		public string Actor { get; }
		public int Words { get; }
		public int LineCount { get; }
		public ShakespeareStatistics (string actor, int words, int lineCount)
		{
			Actor = actor;
			Words = words;
			LineCount = lineCount;
		}
	}

	[Cmdlet(VerbsCommon.Get, "ShakespeareStats")]
	[OutputType(typeof(ShakespeareStatistics))]
	public class RomeoJuliet : PSCmdlet
	{
		private const string ShakespearNamespace = "http://microsoft.com";
		private static readonly XName SpeechName = XName.Get("SPEECH", ShakespearNamespace);
		private static readonly XName LineName = XName.Get("LINE", ShakespearNamespace);
		private static readonly XName SpeakerName = XName.Get("SPEAKER", ShakespearNamespace);

		[Alias("Fullname")]
		[Parameter(Mandatory=true, ValueFromPipelineByPropertyName=true, Position=0)]
		public string Path {get;set;}
		protected override void ProcessRecord()
		{
			var path = GetUnresolvedProviderPathFromPSPath(Path);
			var doc = XDocument.Load(path);
			var speeches = from speech in doc.Descendants(SpeechName)
							select new {
								Speaker=(string)speech.Element(SpeakerName),
								Lines=	from line in speech.Elements(LineName)
										select line.Value
							;
			var top2 = (from speech in speeches
						group speech by speech.Speaker into speakerLines
						let count = speakerLines.Count()
						orderby count descending
						select new
						{
							Speaker = speakerLines.Key,
							Count = count,
							Lines = (	from speaker in speakerLines
										select speaker.Lines).SelectMany(c=>c.Select(l=>l) )
						}).Take(2);
			var stats = from t in top2
						select new ShakespeareStatistics(t.Speaker, t.Count, t.Lines.Select(l=>l.Split(' ').Length).Sum());
			WriteObject(stats, true);
		}
	}
}
