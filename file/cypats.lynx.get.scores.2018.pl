#!/usr/bin/perl -w

#========================================================================
# cypats.lynx.get.scores.2018.pl -- get ALHS Cyber Lynx scores 2018-2019
# @karver 2018-11-28.1609.ACK 
#========================================================================

use strict;								# of course
use warnings;							# why not?

# variables
our $debug	= shift()||0;				# debug 0=none, 1=some
my  %teams	= qw/11-0414 1 11-0415 1/;	# last year 10-4906 10-1181 10-3729/;
my  %last	= ();						# hash to track last timed scores
my  @header	= ();						# array to hold headers for table data
my  %scores	= ();						# to hold cumulative scores

# iterate through our teams
foreach my $team (sort(keys(%teams)))
{
	# URL to get scores
	my $baseUrl='http://scoreboard.uscyberpatriot.org/team.php?team=';
	my $url=$baseUrl.$team;

	# we'll save the HTML / JS from the website to a temp file
	my $file='tmp.cypats.team.'.$team;
	&download($url,$file);

	# process our input
	if(-e $file && open(my $fh,$file))	# test $file exists and open() the thing
	{	
		foreach(<$fh>)					# iterate through lines in $file
		{
			chomp();					# chomp() new lines
			s/^\s+//;					# strip leading spaces
			if(/^\['Time'/)				# if this line has 'Time' we'll get our headers
			{
				s/[\[\]\s']//g;			# lazy strip chars we don't want
				s/\,$//;				# strip trailing comma
				@header=split(/,/);		# populate the @header array with headers
			}
			elsif(/^\[/)
			{
				s/[\[\]\s']//g;			# lazy strip chars we don't want
				s/\,$//;				# strip trailing comma
				$last{$team}=$_;		# set/overwrite hash value in %last for element $team
			}
		}
		close($fh);
	}
	else
	{
		die("FATAL: Could not open file=$file");
	}

	# output stuff
	printf("%7s  %30s  %12s\n",'-' x 7,'-' x 30,'-' x 12);				# print hyphens for  a e s t h e t i c s
	my @r=split(/,/,$last{$team});										# split our scoring data on commas into array @r
	for(my $i=0;$i<=$#header;$i++)										# iterate through the number of elements in @header as $i
	{
		if($header[$i] eq 'Time')										# if this particular header is 'Time'...
		{
			if($r[$i]=~/^(\d{1,2})\/(\d{1,2})(\d{1,2}):(\d{1,2})$/)		# parse 'Time' for mon/day hour:min
			{
				$r[$i]=sprintf('%02d/%02d %02d:%02d',$1,$2,$3,$4);		# format nicely
			}
		}
		#$r[$i]='' if $r[$i] eq 'null';									# could blank out 'null' values (or not, hence this is rem'd)
		$scores{$team}+=int($r[$i]) if $r[$i]=~/^\d+$/;					# unholy tabulation
		printf("%7s  %-30s  %12s\n",$team,$header[$i],$r[$i]);			# print our pretty output
	}
	unlink($file) if !$debug;											# delete our temp file $file unless we're debugging

	printf("%7s  %30s  %12s\n",'-' x 7,'-' x 30,'-' x 12);				# print hyphens for  a e s t h e t i c s
	printf("%7s  %-30s  %12s\n\n\n",$team,'Total',$scores{$team});		# print our pretty output for total score
}

############ GET OVERALLS

# URL to get scores
my $url='http://scoreboard.uscyberpatriot.org/';

# we'll save the HTML / JS from the website to a temp file
my $file='tmp.cypats.team.'.$$;
&download($url,$file);

# process our input
if(-e $file && open(my $fh,$file))	# test $file exists and open() the thing
{
	my $divTierCount=0;
	my $divTierLocCount=0;
	foreach(<$fh>)					# iterate through lines in $file
	{
		chomp();					# chomp() new lines
		s/^\s+//;					# strip leading spaces
		s/\s+$//;					# strip trailing spaces
		#<tr class='clickable' href='team.php?team=11-3156'><td>7</td><td>11-3156</td><td>TX</td><td>Open</td><td>High School</td><td>3</td><td>05:14</td><td></td><td>283</td></tr>
		if(/tr class='clickable' href='team\.php\?team=\d+-\d+'>(.+)/)
		{
			my $stuff=$1;
			$stuff=~s/^/<\/td>/;
			$stuff=~s/<\/tr>/<td>/;
			$stuff=~s/<b>//g;
			$stuff=~s/<\/b>//g;
			my($foo,$rank,$team,$loc,$div,$tier,$scoredImages,$time,$warn,$ccs)=split(/<\/td><td>/,$stuff);
			my $stars=$teams{$team} ? "\t***" : '';
			$divTierCount++ if $div eq 'Open' && $tier eq 'High School';
			$divTierLocCount++ if $div eq 'Open' && $tier eq 'High School' && $loc eq 'IA';
			printf("Rank #%04d: Team $team Loc: $loc (DivTierLoc #%02d) Div/Tier: ${div}/${tier} (#%03d) Images: $scoredImages Time: $time Warn: $warn CCS: ${ccs}%s\n",$rank,$divTierLocCount,$divTierCount,$stars);
		}
	}
	close($fh);
	unlink($file) if !$debug;
	print	"\n".
			"Total divTier:    $divTierCount\n".
			"Total divTierLoc: $divTierLocCount\n".
			"\n";
}


# download($url,$file) -- downloads from $url, saves as $file
sub download
{
	my($url,$file)=@_;
	if($url && $file && open(my $fh,'>',$file))
	{
		foreach(`wget -qO - "$url" 2>/dev/null`)
		{
			print $fh $_;
		}
		close($fh);
	}
	return(0);
}
