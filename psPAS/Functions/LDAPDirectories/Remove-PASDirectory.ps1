# .ExternalHelp psPAS-help.xml
function Remove-PASDirectory {
	[CmdletBinding(SupportsShouldProcess = $true)]
	param(
		[parameter(
			Mandatory = $true,
			ValueFromPipelinebyPropertyName = $true
		)]
		[Alias('DomainName')]
		[string]$id

	)

	BEGIN {
		Assert-VersionRequirement -RequiredVersion 10.7
	}#begin

	PROCESS {

		#Create URL for request
		$URI = "$Script:BaseURI/api/Configuration/LDAP/Directories/$id/"

		if ($PSCmdlet.ShouldProcess($id, 'Delete Directory')) {

			#send request to web service
			Invoke-PASRestMethod -Uri $URI -Method DELETE -WebSession $Script:WebSession

		}

	}#process

	END { }#end

}