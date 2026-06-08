| NVIDIA | Base Command | Manager | 11  |
| ------ | ------------ | ------- | --- |
Installation Manual
| Revision: | ace9b6c85  |     |     |
| --------- | ---------- | --- | --- |
| Date: Wed | Jun 3 2026 |     |     |

©2026NVIDIACorporation&affiliates. AllRightsReserved. Thismanualorpartsthereofmaynotbe
reproducedinanyformunlesspermittedbycontractorbywrittenpermissionofNVIDIACorporation.
Trademarks
Linux is a registered trademark of Linus Torvalds. PathScale is a registered trademark of Cray, Inc.
Red Hat and all Red Hat-based trademarks are trademarks or registered trademarks of Red Hat, Inc.
SUSE is a registered trademark of SUSE LLC. NVIDIA, CUDA, GPUDirect, HPC SDK, NVIDIA DGX,
NVIDIANsight,andNVLinkareregisteredtrademarksofNVIDIACorporation.FLEXlmisaregistered
trademarkofFlexeraSoftware,Inc. PBSProfessional,andGreenProvisioningaretrademarksofAltair
Engineering,Inc. Allothertrademarksarethepropertyoftheirrespectiveowners.
Rights and Restrictions
Allstatements,specifications,recommendations,andtechnicalinformationcontainedhereinarecurrent
orplannedasofthedateofpublicationofthisdocument. Theyarereliableasofthetimeofthiswriting
and are presented without warranty of any kind, expressed or implied. NVIDIA Corporation shall
notbeliablefortechnicaloreditorialerrorsoromissionswhichmayoccurinthisdocument. NVIDIA
Corporationshallnotbeliableforanydamagesresultingfromtheuseofthisdocument.
Limitation of Liability and Damages Pertaining to NVIDIA Corporation
TheNVIDIABaseCommandManagerproductprincipallyconsistsoffreesoftwarethatislicensedby
theLinuxauthorsfreeofcharge. NVIDIACorporationshallhavenoliabilitynorwillNVIDIACorpo-
ration provide any warranty for the NVIDIA Base Command Manager to the extent that is permitted
bylaw. Unlessconfirmedinwriting,theLinuxauthorsand/orthirdpartiesprovidetheprogramasis
withoutanywarranty,eitherexpressedorimplied,including,butnotlimitedto,marketabilityorsuit-
ability for a specific purpose. The user of the NVIDIA Base Command Manager product shall accept
thefullriskforthequalityorperformanceoftheproduct. Shouldtheproductmalfunction,thecostsfor
repair, service, or correction will be borne by the user of the NVIDIA Base Command Manager prod-
uct. No copyright owner or third party who has modified or distributed the program as permitted in
thislicenseshallbeheldliablefordamages,includinggeneralorspecificdamages,damagescausedby
sideeffectsorconsequentialdamages,resultingfromtheuseoftheprogramortheun-usabilityofthe
program (including, but not limited to, loss of data, incorrect processing of data, losses that must be
bornebyyouorothers,ortheinabilityoftheprogramtoworktogetherwithanyotherprogram),even
ifacopyrightownerorthirdpartyhadbeenadvisedaboutthepossibilityofsuchdamagesunlesssuch
copyrightownerorthirdpartyhassignedawritingtothecontrary.

Table of Contents
TableofContents . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
1 QuickstartInstallationGuide 7
1.1 InstallingTheHeadNode . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
1.2 FirstBoot . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10
1.3 BootingRegularNodes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10
1.4 QuickstartForGPUs . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 12
1.5 Optional: UpgradingPython . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 15
1.6 RunningBaseView . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 16
2 Introduction 19
2.1 WhatIsNVIDIABaseCommandManager? . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
2.1.1 WhatOSPlatformsIsItAvailableFor? . . . . . . . . . . . . . . . . . . . . . . . . . 19
2.1.2 WhatArchitecturesDoesItRunOn? . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
2.1.3 WhatFeaturesAreSupportedPerOSAndArchitecture? . . . . . . . . . . . . . . . 20
2.1.4 WhatOSPlatformsCanItBeManagedFrom? . . . . . . . . . . . . . . . . . . . . . 20
2.2 ClusterStructure . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 20
3 InstallingNVIDIABaseCommandManager 23
3.1 MinimalHardwareRequirements. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 23
3.1.1 HeadNode . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 23
3.1.2 ComputeNodes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
3.2 SupportedHardware . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
3.2.1 ComputeNodes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
3.2.2 EthernetSwitches . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
3.2.3 PowerDistributionUnits . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
3.2.4 ManagementControllers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
3.2.5 InfiniBandAndSimilar . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
3.2.6 GPUs . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
3.2.7 RAID . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
3.3 HeadNodeInstallation: BareMetalMethod. . . . . . . . . . . . . . . . . . . . . . . . . . . 25
3.3.1 ISOBootMenu . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26
3.3.2 WelcomeScreen . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
3.3.3 SoftwareLicenses . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
3.3.4 KernelModulesConfiguration . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 29
3.3.5 HardwareInfo . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 30
3.3.6 InstallationSource . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 31
3.3.7 ClusterSettings . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 32
3.3.8 WorkloadManagementConfiguration . . . . . . . . . . . . . . . . . . . . . . . . . . 33
3.3.9 NetworkTopology . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 34
3.3.10 HeadNodeSettings . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 37

4 TableofContents
3.3.11 ComputeNodesSettings . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 38
3.3.12 BMCConfiguration . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 39
3.3.13 Networks . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 40
3.3.14 Headnodeinterfaces . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 42
3.3.15 Computenodeinterfaces . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 42
3.3.16 DiskLayout . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 44
3.3.17 DiskLayoutSettings . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 44
3.3.18 AdditionalSoftware . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 47
3.3.19 Summary . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 48
3.3.20 Deployment . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 49
3.3.21 LicensingAndFurtherConfiguration . . . . . . . . . . . . . . . . . . . . . . . . . . 50
3.4 HeadNodeInstallation: AnsibleAdd-OnMethod . . . . . . . . . . . . . . . . . . . . . . . 50
3.4.1 AnOverviewOfAnsible . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 51
3.4.2 TheHeadNodeAdd-onInstallerAndAnsible . . . . . . . . . . . . . . . . . . . . . 51
3.5 EnablingRemoteBrowser-BasedInstallationViaTheTextModeInstaller . . . . . . . . . . 52
4 LicensingNVIDIABaseCommandManager 53
4.1 DisplayingLicenseAttributes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 54
4.1.1 DisplayingLicenseAttributesWithinBaseView . . . . . . . . . . . . . . . . . . . . 54
4.1.2 DisplayingLicenseAttributesWithincmsh . . . . . . . . . . . . . . . . . . . . . . . 55
4.2 VerifyingALicense—Theverify-licenseUtility . . . . . . . . . . . . . . . . . . . . . . . 55
4.2.1 Theverify-licenseUtilityCanBeUsedWhenlicenseinfoCannotBeUsed . . 56
4.2.2 UsingTheverify-licenseUtilityToTroubleshootLicenseIssues . . . . . . . . . 56
4.2.3 UsingTheversioninfoCommandToVerifyTheBCMSoftwareVersion. . . . . . 57
4.3 RequestingAndInstallingALicenseUsingAProductKey . . . . . . . . . . . . . . . . . . 58
4.3.1 IsALicenseNeeded?—VerifyingLicenseAttributes . . . . . . . . . . . . . . . . . . 58
4.3.2 TheProductKey . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 58
4.3.3 RequestingALicenseWithTherequest-licenseScript . . . . . . . . . . . . . . . 60
4.3.4 InstallingALicenseWithTheinstall-licenseScript . . . . . . . . . . . . . . . . 61
4.3.5 Re-InstallingALicenseAfterReplacingTheHardware . . . . . . . . . . . . . . . . 62
4.3.6 Re-InstallingALicenseAfterWipingOrReplacingTheHardDrive . . . . . . . . . 63
4.3.7 RebootingNodesAfterAnInstall . . . . . . . . . . . . . . . . . . . . . . . . . . . . 63
4.3.8 GettingHelpWithLicensingIssues . . . . . . . . . . . . . . . . . . . . . . . . . . . 64
5 LinuxDistributionsThatUseRegistration 65
5.1 RegisteringARedHatEnterpriseLinuxBasedCluster . . . . . . . . . . . . . . . . . . . . 65
5.1.1 RegisteringAHeadNodeWithRHEL . . . . . . . . . . . . . . . . . . . . . . . . . . 65
5.1.2 RegisteringASoftwareImageWithRHEL . . . . . . . . . . . . . . . . . . . . . . . 66
5.2 RegisteringASUSELinuxEnterpriseServerBasedCluster . . . . . . . . . . . . . . . . . . 66
5.2.1 RegisteringAHeadNodeWithSUSE . . . . . . . . . . . . . . . . . . . . . . . . . . 66
5.2.2 RegisteringASoftwareImageWithSUSE . . . . . . . . . . . . . . . . . . . . . . . . 67
6 ChangingTheNetworkParametersOfTheHeadNode 69
6.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 69
6.2 Method . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 69
6.3 Terminology . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 69

TableofContents 5
7 ThirdPartySoftware 73
7.1 ModulesEnvironment . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 73
7.2 Shorewall. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 73
7.2.1 TheShorewallServiceParadigm . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 73
7.2.2 ShorewallZones,Policies,AndRules . . . . . . . . . . . . . . . . . . . . . . . . . . 74
7.2.3 ClearAndStopBehaviorInserviceOptions,bashShellCommand,AndcmshShell 75
7.2.4 AddingToShorewallConfigurationViaARoleIncmsh . . . . . . . . . . . . . . . . 75
7.2.5 FurtherShorewallQuirks . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 77
7.3 TheGCCCompiler . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 78
7.4 AMDGPUDriverInstallation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 78
7.4.1 AMDGPUHardwareCheck . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 79
7.4.2 AMDGPUDriverInstallationPerSupportedDistribution . . . . . . . . . . . . . . 79
8 TheNVIDIAHPCSDK 83
8.1 PackagesAndVersions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 83
8.2 CompilerModules . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 84
8.3 ViewingInstalledAvailableCUDAVersions,AndTheRunningCUDAVersion . . . . . . 84
8.4 ChangingTheRunningCUDAVersion . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 85
9 CUDAForGPUs 87
9.1 InstallingCUDA . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 87
9.1.1 CUDAPackagesAvailable . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 87
9.1.2 CUDAPackageAndModules . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 91
9.2 VerifyingCUDA . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 92
9.3 VerifyingOpenCL . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 94
9.4 NVIDIAValidationSuite(Package: cuda-dcgm-nvvs) . . . . . . . . . . . . . . . . . . . . . 95
9.5 FurtherNVIDIAConfigurationViaTheClusterManager . . . . . . . . . . . . . . . . . . . 97
10 OFEDSoftwareStack 99
10.1 Choosing A Distribution Version, Or A Non-distribution Version, Ensuring The Kernel
Matches,AndLoggingTheInstallation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 99
10.2 DOCAOFEDStackInstallationUsingTheBCMDOCAOFEDInstallationScript . . . . . 99
11 BurningNodes 101
11.1 TestScriptsDeployment . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 101
11.2 BurnConfigurations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 101
11.2.1 BurnConfigurationSimpleXMLExample . . . . . . . . . . . . . . . . . . . . . . . 101
11.2.2 BurnConfigurationXMLSchemaDefinition . . . . . . . . . . . . . . . . . . . . . . 103
11.3 RunningABurnConfiguration . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 103
11.3.1 BurnConfigurationAndExecutionIncmsh . . . . . . . . . . . . . . . . . . . . . . . 103
11.3.2 WritingATestScript . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 109
11.3.3 BurnFailures . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 112
11.4 RelocatingTheBurnLogs . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 113
11.4.1 ConfiguringTheRelocation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 113
11.4.2 TestingTheRelocation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 114

6 TableofContents
12 InstallingAndConfiguringSELinux 117
12.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 117
12.2 EnablingSELinuxOnRHEL8,Rocky9 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 117
12.2.1 SettingSELinuxParameters . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 117
12.2.2 SettingUpOnTheHeadNode . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 118
12.2.3 SettingUpOnTheRegularNodes . . . . . . . . . . . . . . . . . . . . . . . . . . . . 118
A OtherLicenses,Subscriptions,OrSupportVendors 121
B HardwareRecommendations 123
B.1 HeuristicsForRequirements. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 123
B.1.1 HeuristicsForRequirementsForARegularNode . . . . . . . . . . . . . . . . . . . 123
B.1.2 HeuristicsForRequirementsForAHeadNode . . . . . . . . . . . . . . . . . . . . 123
B.2 ObservedHeadNodeResourcesUse,AndSuggestedSpecification . . . . . . . . . . . . . 124
B.2.1 ObservedHeadNodeExampleCMDaemonAndMySQLResourcesUse . . . . . 124
B.2.2 SuggestedHeadNodeSpecificationForClustersBeyond1000Nodes . . . . . . . 124
C BCMAndNVIDIAAIEnterprise 125
C.1 CertifiedFeaturesOfBCMForNVIDIAAIEnterprise . . . . . . . . . . . . . . . . . . . . . 125
C.2 NVIDIAAIEnterpriseCompatibleServers . . . . . . . . . . . . . . . . . . . . . . . . . . . 125
C.3 NVIDIASoftwareVersionsSupported . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 125
C.4 NVIDIAAIEnterpriseProductSupportMatrix . . . . . . . . . . . . . . . . . . . . . . . . . 126
D NVIDIABCMScopeOfSupport 127
D.1 IncludedInBCMSupport . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 127
D.1.1 SupportForClusterInstallation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 127
D.1.2 SupportForClusterConfiguration . . . . . . . . . . . . . . . . . . . . . . . . . . . . 127
D.1.3 SupportForIntegrationOfClusterInSiteInfrastructure . . . . . . . . . . . . . . . 127
D.1.4 SupportForIntegrationWithMicrosoftActiveDirectory . . . . . . . . . . . . . . . 127
D.1.5 SupportForFirst-PartyHardwareOnly . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.1.6 SupportForSoftwareUpgrades . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.2 ExcludedFromBCMSupport . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.2.1 HelpWithThird-PartySoftware . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.2.2 HelpWithUserApplications . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.2.3 HelpWithWorkloadManagement . . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.2.4 HelpWithPerformanceIssues . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.2.5 Root-CauseAnalysis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.2.6 PhoneSupport . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 128
D.3 SupportOutsideOfTheStandardScope—GettingProfessionalServices . . . . . . . . . . 129

1
Quickstart Installation Guide
This chapter describes a basic and quick installation of NVIDIA Base Command Manager (BCM) on
“baremetal”clusterhardwareasastep-by-stepprocess, andgivesverylittleexplanationofthesteps.
Followingthesestepsshouldallowamoderatelyexperiencedclusteradministratortogetaclusterup
and running in a fairly standard configuration as quickly as possible. This would be without even
having to read the introductory Chapter 2 of this manual, let alone the entire manual. References to
chaptersandsectionsareprovidedwhereappropriate.
Someasides,beforegettingonwiththestepsthemselves:
• If the cluster has already been installed, tested, and configured, but only needs to be configured
nowforanewnetwork,thentheadministratorshouldonlyneedtolookatChapter6. Chapter6
laysouthowtocarryoutthemostcommonconfigurationchangesthatusuallyneedtobedoneto
maketheclusterworkinthenewnetwork.
• For administrators that are very unfamiliar with clusters, reading the introduction (Chapter 2)
andthenthemoredetailedinstallationwalkthroughforabaremetalinstallation(Chapter3,sec-
tions 3.1, 3.2, and 3.3) is recommended. Having carried out the head node installation, the ad-
ministratorcanthenreturntothisquickstartchapter(Chapter1), andcontinueonwardwiththe
quickstartprocessofregularnodeinstallation(section1.3).
• The configuration and administration of the cluster after it has been installed is covered in the
BCMAdministratorManual. TheAdministratorManualshouldbeconsultedforfurtherbackground
informationaswellasguidanceonclusteradministrationtasks,aftertheintroduction(Chapter2)
oftheInstallationManualhasbeenread.
• If all else fails, administrator-level support is available via https://www.nvidia.com/en-us/
data-center/bright-cluster-manager/support/. Section 14.2 of the Administrator Manual has
further details on how to brief the support team, so that the issue can be resolved as quickly as
possible.
Thequickstartstepsnowfollow:
1.1 Installing The Head Node
Theheadnodedoesnotneedtobeconnectedtotheregularnodesatthispoint,thoughithelpstohave
thewiringdonebeforehandsothathowthingsareconnectedisknown.
1. TheBIOSoftheheadnodeshouldhavethelocaltimeset.
2. TheheadnodeshouldbebootedfromtheBCMinstallationDVDorfromaUSBflashdrivewith
theDVDISOonit.

8 QuickstartInstallationGuide
3. The option: Start Base Command Manager Graphical Installer, or Start Base Command
ManagerText Installer, should be selected in the text boot menu. The graphical installation
isrecommended,andbringsuptheGUIinstallationwelcomescreen. Thetextinstallerprovidesa
minimalncurses-basedversionoftheGUIinstallation.
OnlytheGUIinstallationisdiscussedintherestofthisquickstartforconvenience.
4. AttheGUIwelcomescreen,theStart installationbuttonshouldbeclicked.
5. AttheEULAscreens:
• AttheNVIDIAEULAscreen,theacceptancecheckboxshouldbeticked. Nextshouldthenbe
ticked.
• AttheLinuxbasedistributionEULAscreen,theacceptancecheckboxshouldbeticked. Next
shouldthenbeclicked.
6. AttheKernel modulesscreen,Nextshouldbeclicked.
7. At the Hardware info screen, the detected hardware should be reviewed. If additional kernel
modulesarerequired,thentheadministratorshouldgobacktotheKernel Modulesscreen. Once
alltherelevanthardware(Ethernetinterfaces,harddriveandDVDdrive)isdetected,Nextshould
beclicked.
8. At the Installation source screen, the DVD drive containing the BCM DVD, or the USB flash
drivecontainingtheDVDISO,shouldbeselected,thenNextclicked.
9. At the General cluster settings screen, one or more nameservers and one or more domains
canbeset,iftheyhavenotalreadybeenautomaticallyfilled. Theremainingsettingscanusually
beleftasis.
10. AttheWorkload managementscreen,anHPCworkloadmanagercanbeselected. Thechoicecan
bemadelaterontoo,afterBCMhasbeeninstalled.
11. FortheNetwork topologyscreen,aType1networkisthemostcommon.
12. FortheHead node settingsscreen,theheadisgivenanameandapassword.
13. FortheCompute nodes settingsscreen,theheadisgivenanameandapassword.
• Thenumberofracksandregularnodesarespecified
• Thebasenamefortheregularnodesisset.Acceptingthedefaultofnodemeansnodesnames
areprefixedwithnode,forexample: node001,node002...
• Thenumberofdigitstoappendtothebasenameisset. Forexample,acceptingthedefaultof
3meansnodesfromnode001tonode999arepossiblenames.
• Thecorrecthardwaremanufacturerisselected
14. For the BMC configuration screen, the use of IPMI/iLO/DRAC/CIMC/Redfish BMCs is
carried out. Adding an IPMI/iLO/DRAC/CIMC/Redfish network is needed to configure
IPMI/iLO/DRAC/CIMC/RedfishinterfacesinadifferentIPsubnet,andisrecommended.
15. AttheNetworksscreen,thenetworkparametersfortheheadnodeshouldbeenteredfortheinter-
facefacingthenetworknamedexternalnet:
• If using DHCP on that interface, the parameters for IP Address, Netmask and Gateway as
suggestedbytheDHCPserverontheexternalnetworkcanbeaccepted.
• IfnotusingDHCPonthatinterface,staticvaluesputininstead.

1.1InstallingTheHeadNode 9
Thenetworkparametersforexternalnetthatcanbesetincludethe:
• baseaddress(alsocalledthenetworkaddress)
• netmask
• domainname
Thenetworkexternalnetcorrespondstothesitenetworkthattheclusterresidesin(forexample,
acorporateorcampusnetwork). TheIPaddressdetailsarethereforethedetailsoftheheadnode
foratype1externalnetnetwork(figure3.10). Adomainnameshouldbeenteredtosuitthelocal
requirements.
16. For the Head node interfaces screen, the head node network interfaces are assigned networks
andIPaddresses. Theassignedvaluescanbereviewedandchanged.
17. AttheCompute node interfacesscreen,thecomputenodeinterfacesareassignednetworksand
IPaddresses. Theassignedvaluescanbereviewedandchanged.
18. AttheDisk layoutscreen,adriveshouldbeselectedfortheheadnode. Theinstallationwillbe
doneontothisdrive,overwritingallitspreviouscontent.
19. AttheDisk layout Settingsscreen, theadministratorcanmodifythedisklayoutforthehead
nodebyselectingapre-definedlayout.
For hard drives that have less than about 500GB space, the XML file
master-one-big-partition.xmlintheinstallerfilesystemisusedbydefault:
| Partition | Space MountedAt | FilesystemType |
| --------- | --------------- | -------------- |
| 1         | 1G /boot        | ext2           |
| 0         | 100M /boot/efi  | fat            |
| 2         | 16G -           | swap           |
| 3         | rest /          | xfs            |
Defaultlayoutforupto500GB:Onebigpartition.
For hard drives that have about 500GB or more of space, the XML file master-standard.xml is
usedbydefault:
| Partition | Space MountedAt | FilesystemType |
| --------- | --------------- | -------------- |
| 1         | 1G /boot        | ext2           |
| 0         | 100M /boot/efi  | fat            |
| 2         | 16G -           | swap           |
| 3         | 20G /tmp        | xfs            |
| 4         | 180G /var       | xfs            |
| 5         | rest /          | xfs            |
Defaultlayoutformorethan500GB:Severalpartitions.
Thelayoutsindicatedbythesetablesmaybefine-tunedbyeditingtheXMLpartitioningdefinition
duringthisstage.The“max”settingintheXMLfilecorrespondstothe“rest”entryinthesetables,
andmeanstherestofthedrivespaceisusedupfortheassociatedpartition,whatevertheleftover
spaceis.
Therearelayouttemplatesavailablefromamenu,otherthantheprecedingdefaultlayouts.

10 QuickstartInstallationGuide
20. AttheAdditional softwarescreen,extrasoftwareoptionscanbechosenforinstallationifthese
wereselectedfortheinstallationISO.Theextrasoftwareoptionsare:
• CUDA
• OFEDstack
21. TheSummaryscreenshouldbereviewed. Awrongentrycanstillbefixedatthispoint. TheNext
buttonthenstartstheinstallation.
22. TheDeploymentscreenshouldeventuallycomplete. ClickingonRebootrebootstheheadnode.
1.2 First Boot
1. TheDVDshouldberemovedortheboot-orderalteredintheBIOStoensurethattheheadnode
bootsfromthefirstharddrive.
2. Once the machine is fully booted, a login should be done as root with the password that was
enteredduringinstallation.
3. A check should be done to confirm that the machine is visible on the external network. Also, it
shouldbecheckedthatthesecondNIC(i.e. eth1)isphysicallyconnectedtotheexternalnetwork.
4. IftheparentdistributionforBCMisRHELandSUSEthenregistration(Chapter5)shouldusually
bedone.
5. Thelicenseparametersshouldbeverifiedtobecorrect:
cmsh -c "main licenseinfo"
If the license being used is a temporary license (see End Time value), a new license should be
requestedwellbeforethetemporarylicenseexpires. Theprocedureforrequestingandinstalling
anewlicenseisdescribedinChapter4.
6. The head node software should be updated via its package manager (yum, dnf, apt, zypper) so
thatithasthelatestpackages(sections9.2-9.3oftheAdministratorManual).
1.3 Booting Regular Nodes
1. A check should be done to make sure the first NIC (i.e. eth0) on the head node is physically
connectedtotheinternalclusternetwork.
2. The BIOS of regular nodes should be configured to boot from the network. The regular nodes
should then be booted. No operating system is expected to be on the regular nodes already. If
there is an operating system there already, then by default, it is overwritten by a default image
providedbytheheadnodeduringthenextstages.
3. Ifeverythinggoeswell,thenode-installercomponentstartsoneachregularnodeandacertificate
requestissenttotheheadnode.
If a regular node does not make it to the node-installer stage, then it is possible that additional
kernelmodulesareneeded. Section5.8oftheAdministratorManualcontainsmoreinformationon
howtodiagnoseproblemsduringtheregularnodebootingprocess.
4. Toidentifytheregularnodes(thatis,toassignahostnametoeachphysicalnode),severaloptions
areavailable. Whichoptionismostconvenientdependsmostlyonthenumberofregularnodes
andwhethera(configured)managedEthernetswitchispresent.
Rather than identifying nodes based on their MAC address, it is often beneficial (especially in
largerclusters)toidentifynodesbasedontheEthernetswitchportthattheyareconnectedto. To

1.3BootingRegularNodes 11
allownodestobeidentifiedbasedonEthernetswitchports,section3.8oftheAdministratorManual
shouldbeconsulted.
Ifanodeisunidentified,thenitsnodeconsoledisplaysanncursesmessagetoindicateitisanun-
knownnode,andthenetbootkeepsretryingitsidentificationattempts. Anyoneofthefollowing
methodsmaybeusedtoassignnodeidentitieswhennodesstartupasunidentifiednodes:
a. Identifyingeachnodeonthenodeconsole: Tomanuallyidentifyeachnode,the“Manually
select node”optionisselectedforeachnode. Thenodeisthenidentifiedmanuallybyse-
Accept
lecting a node-entry from the list, choosing the option. This option is easiest when
there are not many nodes. It requires being able to view the console of each node and key-
boardentrytotheconsole.
b. Identifying nodes using cmsh: In cmsh the newnodes command in device mode (page 255,
section 5.4.2 of the Administrator Manual) can be used to assign identities to nodes from the
command line. When called without parameters, the newnodes command can be used to
verifythatallnodeshavebootedintothenode-installerandareallwaitingtobeassignedan
identity.
c. IdentifyingnodesusingBaseView:Thenodeidentificationresource(page259,section5.4.2
of the Administrator Manual) in Base View automates the process of assigning identities so
thatmanualidentificationofnodesattheconsoleisnotrequired.
Example
Toverifythatallregularnodeshavebootedintothenode-installer:
| [root@mycluster   | ~]# cmsh                 |               |                         |                |
| ----------------- | ------------------------ | ------------- | ----------------------- | -------------- |
| [mycluster]%      | device newnodes          |               |                         |                |
| MAC               | First                    | appeared      | Detected                | on switch port |
| ----------------- | ------------------------ |               | ----------------------- |                |
| 00:0C:29:D2:68:8D | 05 Sep                   | 2011 13:43:13 | PDT [no                 | port detected] |
| 00:0C:29:54:F5:94 | 05 Sep                   | 2011 13:49:41 | PDT [no                 | port detected] |
...
| [mycluster]%      | device newnodes     | | wc -l  |                         |                |
| ----------------- | ------------------- | -------- | ----------------------- | -------------- |
| MAC               | First               | appeared | Detected                | on switch port |
| ----------------- | ------------------- |          | ----------------------- |                |
32
| [mycluster]%    | exit |     |     |     |
| --------------- | ---- | --- | --- | --- |
| [root@mycluster | ~]#  |     |     |     |
Example
Onceallregularnodeshavebeenbootedintheproperorder,theorderoftheirappearanceonthe
network can be used to assign node identities. To assign identities node001 through node032 to
thefirst32nodesthatwerebooted,thefollowingcommandsmaybeused:
| [root@mycluster   | ~]# cmsh                      |          |                  |             |
| ----------------- | ----------------------------- | -------- | ---------------- | ----------- |
| [mycluster]%      | device newnodes               | -s -n    | node001..node032 |             |
| MAC               | First                         | appeared |                  | Hostname    |
| ----------------- | ----------------------------- |          |                  | ---------   |
| 00:0C:29:D2:68:8D | Mon, 05                       | Sep 2011 | 13:43:13         | PDT node001 |
| 00:0C:29:54:F5:94 | Mon, 05                       | Sep 2011 | 13:49:41         | PDT node002 |
...
| [mycluster]%    | exit |     |     |     |
| --------------- | ---- | --- | --- | --- |
| [root@mycluster | ~]#  |     |     |     |

12 QuickstartInstallationGuide
5. Eachregularnodeisnowprovisionedandeventuallyfullyboots. Fortroubleshootingnodeboot-
ingissues,section5.8oftheAdministratorManualshouldbeconsulted.
6. Optional: To configure node-level power management, Chapter 4 of the Administrator Manual
shouldbeconsulted.
7. To update the software on the nodes, a package manager is used to install to the node image
filesystemthatisontheheadnode.
Thenodeimagefilesystemshouldbeupdatedviaitspackagemanager(yum,dnf,apt,zypper)so
thatithasthelatestpackages(sections9.4-9.5oftheAdministratorManual).
1.4 Quickstart For GPUs
Thisassumesthattheheadnodesandregularnodesareupandrunning. GettingGPUssetuprightcan
bedoneasfollowsforatypicalinstallation:
1. GPUHardwareAndSanityCheck
If the hardware is not detected, then that must first be fixed. Checking for the hardware can be
doneasfollows:
(a) NVIDIAGPUhardwareshouldbedetectedonthenodesthatuseit. ThisistrueforNVIDIA
GPU units (separate from the nodes) as well as for on-board NVIDIA GPUs. The lspci
commandcanbeusedfordetection. Forexample,thepresenceofGPUhardwareonnode001
can be detected by the kernel, even if its associated kernel module software drivers are not
loaded:
Example
[root@basecm11 ~]# ssh node001 lspci | grep NVIDIA
00:07.0 3D controller: NVIDIA Corporation GK110BGL [Tesla K40c] (rev a1)
If there is no 3D controller string, then it typically means that the GPU is too old to be
supported,orthatthereisnoGPUactuallythere. Typically,eachGPUdisplaysaline,corre-
spondingtoitslocationonthePCIbus. So4GPUsonanodewouldshow4lines.
Supported GPU architectures at the time of writing (May 2026) are Turing, Ampere, Ada
Lovelace,Hopper,andBlackwell.
(b) AMD CPUs, which have a GPU integrated with the CPU, the CPU chip can similarly be
identifiedwithlscpu:
Example
[root@basecm11 ~]# ssh node001 lscpu | grep "Model name:"
Model name: AMD Ryzen 5 2500U with Radeon Vega Mobile Gfx
TheAMDchipscanthenbecheckedagainstthelistofAMDchipswithAMDGPUs,aslisted
athttps://www.amd.com/en/support/kb/release-notes/rn-prorad-lin-18-20
2. InstallingTheSoftware
(a) DetailsofAMDGPUsoftwareinstallationaregiveninsection7.4.
(b) ForNVIDIAGPUs, assumingtheGPUisonthecomputenodenode001, andthatthehard-
ware is supportedby CUDA 13.0, thensoftware installation is carriedout at the head node
asfollows:

1.4QuickstartForGPUs 13
i. CUDAtoolkit,softwaredevelopmentkit,andvisualtoolsareinstalledontheheadnode
itselfwith:
Example
root@basecm11:~# apt install cuda13.0-toolkit cuda13.0-sdk cuda13.0-visual-tools
ii. By default, the image (/cm/images/default-image) used by nodes already has the re-
quired NVIDIA driver software packages installed. These therefore do not need to be
installedexplicitly.
FurtherdetailsonthebasicinstallationofCUDAforNVIDIAGPUsaregiveninChap-
ter9.
3. ConfiguringGPUsForTheClusterManager
AftertheGPUsoftwarehasbeeninstalled,thegpusettingssubmodecanbeusedunderdevice
modeforthenodesthathaveGPUs.ThissubmodeallowstheclusteradministratortomodifyGPU
values. Keepingthedefaultsettingsinthesubmodeshouldbefine,whichmeansconfigurationof
GPUsettingscansimplybeskipped.
However,ifneeded,thenthesettingscanbemodifiedasdescribedinsection3.16.2oftheAdmin-
istratorManual,
(a) onpage182forNVIDIAGPUs
(b) onpage185forAMDGPUs.
4. ConfiguringGPUsForTheWorkloadManager
Aworkloadmanagercanbesetupfromtheheadnodebyrunning:
[root@basecm11 ~]# cm-wlm-setup
This starts up a TUI configuration. An NVIDIA GPU can be configured via for Slurm using the
Setup (Step by Step)optionforSlurm(section7.3.2oftheAdministratorManual).
After configuring the WLM server, WLM submission and WLM client roles for the nodes of the
cluster,ascreenthatasksifGPUresourcesshouldbeconfiguredisdisplayed(figure1.1):
Figure1.1: SlurmWithcm-wlm-setup: GPUConfigurationEntryScreen
FollowingthroughbringsupaGPUdevicesettingsconfigurationscreen(figure1.2):
Figure1.2: SlurmWithcm-wlm-setup: GPUDeviceSettingsConfigurationScreen

14 QuickstartInstallationGuide
Thehelptextoptioninthescreengiveshintsbasedonthedescriptionsathttps://slurm.schedmd.
| com/gres.conf.html,andalsoasseeninSlurm’sman |     |     | gres.conf.5. |
| -------------------------------------------- | --- | --- | ------------ |
Figure1.2shows2physicalGPUsonthenodebeingconfigured. Thetypeisanarbitrarystringfor
theGPU,andeachCPUcoreisallocatedanaliasGPUdevice.
Thenextscreen(figure1.3)allowstheNVIDIACUDAMPS(Multi-ProcessService)tobeconfig-
ured:
ConfiguringAnNVIDIAGPUForSlurmWithcm-wlm-setup:
Figure1.3: MPSSettingsConfiguration
Screen
The help text for this screen gives hints on how the fields can be filled in. The number of GPU
cores(figure1.3)foraGPUdevicecanbeset.
Therestofthecm-wlm-setupprocedurecanthenbecompleted.
Theregularnodesthathadarolechangeduringcm-wlm-setupcanthenberebootedtopickupthe
workloadmanager(WLM)services. Acheckviathecmshcommanddsshouldshowwhatnodes
needarestart.
Example
’ ’
| [root@basecm11 | ~]# cmsh | -c ds |     |
| -------------- | -------- | ----- | --- |
node001 ... [ UP ], restart required (cm-wlm-setup: compute role assigned)
node002 ... [ UP ], restart required (cm-wlm-setup: compute role assigned)
...
If,forexample,therangefromnode001tonode015needstoberestartedtogettheWLMservices
running,thenitcouldbecarriedoutwith:
Example
’ ’
| [root@basecm11 | ~]# cmsh | -c device; reboot | -n node001..node015 |
| -------------- | -------- | ----------------- | ------------------- |
NVIDIA configuration for Slurm and other workload managers is described in further detail in
section7.5oftheAdministratorManual
5. RunningAGPUSlurmJob
Ausercanbecreatedwith,forexample,anunimaginativenamesuchasauser:
| [root@basecm11             | ~]# cmsh       |              |     |
| -------------------------- | -------------- | ------------ | --- |
| [basecm11]%                | user add auser |              |     |
| [basecm11->user*[auser*]]% |                | set password |     |
| enter new password:        |                |              |     |
| retype new                 | password:      |              |     |
| [basecm11->user*[auser*]]% |                | ..           |     |
| [basecm11->user*]%         | commit         |              |     |

| 1.5Optional: | UpgradingPython |     |     |     | 15  |
| ------------ | --------------- | --- | --- | --- | --- |
The “Hello World” helloworld.cu script from section 7.5.4 of the User Manual can be saved in
auser’sdirectory,andthencompiledforaGPUwithnvcc:
| [auser@basecm11 |     | ~]$ | module load        | shared cuda12.3/toolkit |     |
| --------------- | --- | --- | ------------------ | ----------------------- | --- |
| [auser@basecm11 |     | ~]$ | nvcc helloworld.cu | -o helloworld           |     |
Aslurmgpuhello.shbatchscriptcanbebuiltasfollows:
| [auser@basecm11 |     | ~]$ | cat slurmgpuhello.sh |     |     |
| --------------- | --- | --- | -------------------- | --- | --- |
#!/bin/sh
| #SBATCH | -o                  | my.stdout |                |                |     |
| ------- | ------------------- | --------- | -------------- | -------------- | --- |
| #SBATCH | --time=30           |           | #time limit    | to batch job   |     |
| #SBATCH | --ntasks-per-node=1 |           |                |                |     |
| #SBATCH | -p                  | defq      | #assuming      | gpu is in defq |     |
| #SBATCH | --gpus=1            |           |                |                |     |
| echo    | -n "hostname        |           | is "; hostname |                |     |
| module  | clear               | -f        |                |                |     |
./helloworld
Itcanbesubmittedasabatchjobfromtheheadnode:
| [auser@basecm11 |       | ~]$ | module load             | slurm |     |
| --------------- | ----- | --- | ----------------------- | ----- | --- |
| [auser@basecm11 |       | ~]$ | sbatch slurmgpuhello.sh |       |     |
| Submitted       | batch | job | 35                      |       |     |
TheoutputfromsubmissiontoanodewithaGPUcanthenbeseen:
| [auser@basecm11 |         | ~]$            | cat my.stdout       |        |     |
| --------------- | ------- | -------------- | ------------------- | ------ | --- |
| hostname        | is      | node001        |                     |        |     |
| String          | for     | encode/decode: | Hello               | World! |     |
| String          | encoded | on             | CPU as: Uryy|-d|yq. |        |     |
| String          | decoded | on             | GPU as: Hello       | World! |     |
| [auser@basecm11 |         | ~]$            |                     |        |     |
MoreaboutSlurmbatchscriptsandGPUcompilationcanbefoundinChapter7oftheUserMan-
ual.
| 1.5 Optional: |     | Upgrading | Python |     |     |
| ------------- | --- | --------- | ------ | --- | --- |
TheversionofPythonprovidedbytheLinux-basedOSdistributorstypicallylagssignificantlybehind
the latest upstream version. This is normally a good thing, since the distributors provide integration,
andcarryouttestingtomakesurethatitworkswellwiththerestoftheOS.
Some BCM tools and packages rely on some of the later features of Python, and by default BCM
installs its own later Python version via a package dependency when needed. So explicit upgrades
to Python are not needed for BCM itself. For example, for Rocky Linux 9.5, the default (distribution)
versionofPythonatthetimeofwriting(June2025)isPythonversion3.9,whileBCMversion11installs
anddeploysaPythonversion3.12whenneeded.
However,someclusteradministratorswouldalsoliketohavevariousPythonversionsavailableon
their cluster for user applications. For example, because users too would like to use later versions for
theirnicerfeatures. BCMthereforemakesthesevariousversionsofPythonavailablefortheenduserin
anintegratedmanner,asanoptionalinstallation.
For example, for NVIDIA Base Command Manager version 11.0, the Python packages that can be
installedfromtheclustermanagerrepositoryare:

16 QuickstartInstallationGuide
• cm-python39,forPython3.9
• cm-python311,forPython3.11
• cm-python312,forPython3.12
Ifthepackagesareinstalled,thenuserscanusethemodulescommandtoswitchtheenvironmenttothe
appropriatePythonversion. Forexample,auserfredcanswitchtoPython3.12with:
| [fred@basecm11 | ~]$ python | -V  |     |     |
| -------------- | ---------- | --- | --- | --- |
Python 3.9.18
| [fred@basecm11 | ~]$ module | load python312 |     |     |
| -------------- | ---------- | -------------- | --- | --- |
| [fred@basecm11 | ~]$ python | -V             |     |     |
Python 3.12.11
If the change is carried out correctly, then support is not available for Python-related bugs, but is
availableforBCM-relatedfeatures.
TheJupytermoduleisanexampleofamodulethatautomaticallyloadsitsownversionofPython.
ThismaycauseconfusionifthesystemadministratorisnotpayingattentiontowhichversionofPython
isactive.Forexample,inBCM11.0,withRocky9.5,iftheuserisusingthedistributionversionofPython
3.9, and then Jupyter is loaded, the Python version used changes to 3.12 as it automatically loads the
python312module:
Example
| [root@basecm11   | ~]# module   | list |     |     |
| ---------------- | ------------ | ---- | --- | --- |
| Currently Loaded | Modulefiles: |      |     |     |
1) shared 2) cmsh 3) cmd 4) cluster-tools/master 5) cm-setup/master 6) cm-image/master
| [root@basecm11 | ~]# python | -V  |     |     |
| -------------- | ---------- | --- | --- | --- |
Python 3.9.19
| [root@basecm11 | ~]# module | load jupyter |     |     |
| -------------- | ---------- | ------------ | --- | --- |
Loading jupyter/16.0.6
| Loading requirement: |            | python312 |     |     |
| -------------------- | ---------- | --------- | --- | --- |
| [root@basecm11       | ~]# python | -V        |     |     |
Python 3.12.11
| [root@basecm11      | ~]# module  | remove python312 |                 |         |
| ------------------- | ----------- | ---------------- | --------------- | ------- |
| Unloading python312 |             |                  |                 |         |
| ERROR: python312    | cannot      | be unloaded      | due to a        | prereq. |
| HINT: Might         | try "module | unload           | jupyter/16.0.6" | first.  |
| 1.6 Running         | Base        | View             |                 |         |
To run Base View on the cluster from a workstation running X11: A recent web browser should be
used,andpointedto
https://<headnodeaddress>:8081/base-view/
AsuitablewebbrowseristhelatestChromefromGoogle, butOpera, Firefox, Chromium, andsimilar
shouldallalsojustwork. Thehardwareonwhichthebrowserrunsshouldbereasonablymodern.
Theclustershouldnowbereadyforrunningcomputejobs.
Formoreinformation:
• Thismanual,theInstallationManual,hasmoredetailsandbackgroundontheinstallationof
theclusterinthenextchapters.
• The Upgrade Manual describes upgrading from earlier versions of NVIDIA Base Command
Manager.

1.6RunningBaseView 17
• TheAdministratorManualdescribesthegeneralmanagementofthecluster.
• TheUserManualdescribestheuserenvironmentandhowtosubmitjobsfortheenduser
• TheCloudburstingManualdescribeshowtodeploythecloudcapabilitiesofthecluster.
• TheDeveloperManualhasusefulinformationfordeveloperswhowouldliketoprogramwith
BCM.
• TheContainerizationManualdescribeshowtomanagecontainerswithBCM.
• TheNVIDIAMissionControlManualdescribesNVIDIAMissionControlcapabilitiesandin-
tegrationwithBCM.

2
Introduction
ThischapterintroducessomefeaturesofNVIDIABaseCommandManageranddescribesabasiccluster
intermsofitshardware.
2.1 What Is NVIDIA Base Command Manager?
NVIDIABaseCommandManager11isaclustermanagementapplicationbuiltontopofmajorLinux
distributions.
2.1.1 WhatOSPlatformsIsItAvailableFor?
BCMisavailableforthefollowingOSplatforms:
• RedHatEnterpriseLinuxServerandsomederivatives,suchasRockyLinux
– Versions8.x
– Versions9.x.
• SLESversions:
– SUSEEnterpriseServer15
• Ubuntuversions:
– JammyJellyfish22.04
– NobleNumbat24.04
– DGXOS7(describedathttps://docs.nvidia.com/dgx/dgx-os-7-user-guide/introduction.
html)
Typically BCM is installed either on a head node, or on a pair of head nodes in a high availability
configuration. Images are provisioned to the non-head nodes from the head node(s). The OS for the
imagesisbydefaultthesameasthatoftheheadnode(s),buttheOSusedfortheimagescanbechanged
lateron(section9.6oftheAdministratorManual).
AtthetimeofwritingofthissectioninSeptember2023,theOSplatformslistedallsupportNVIDIA
AIEnterprise(https://docs.nvidia.com/ai-enterprise/index.html),withtheexceptionfornowof
RHEL9andderivatives.
2.1.2 WhatArchitecturesDoesItRunOn?
Withinthedistributionslistedinsection2.1.1,theBCMapplicationrunsonthefollowingarchitectures:
• onthex86_64architecturethatissupportedbyIntelandAMD64-bitCPUs
• onthearm64(AArch64)architecturethatissupportedbyARMv8CPUs

20 Introduction
2.1.3 WhatFeaturesAreSupportedPerOSAndArchitecture?
BCM aims to run so that it is independent of the chosen OS and architecture. That is, it aims to work
thesamewayforeachOSorarchitecture. Therearenecessarilysomelimitationstothis,andtheseare
documentedinafeaturematrixathttps://service.bcm.nvidia.com/feature-matrix/.
2.1.4 WhatOSPlatformsCanItBeManagedFrom?
WhileBCMrunsdirectlyontheOSplatformslistedinsection2.1.1,BCMcanbemanagedfrommany
moreOSplatforms,whencontrolledbythesefrontends:
• Base View (section 2.4 of the Administrator Manual): a GUI which conveniently runs on modern
desktop web browsers, and therefore on all operating system versions that support a modern
browser. ThisincludesMicrosoftWindows,MacOSandiOS,andLinux.
• cmsh(section2.5oftheAdministratorManual): aninteractiveshellfrontendthatcanbeaccessed
fromanycomputingdevicewithasecuredSSHterminalaccess.
2.2 Cluster Structure
Initsmostbasicform,aclusterrunningBCMcontains:
• Onemachinedesignatedastheheadnode
• Severalmachinesdesignatedascomputenodes
• Oneormore(possiblymanaged)Ethernetswitches
• Oneormorepowerdistributionunits(Optional)
Theheadnodeisthemostimportantmachinewithinaclusterbecauseitcontrolsallotherdevices,
suchascomputenodes,switchesandpowerdistributionunits. Furthermore,theheadnodeisalsothe
hostthatallusers(includingtheadministrator)logintoinadefaultcluster. Theheadnodeistypically
theonlymachinethatisconnecteddirectlytotheexternalnetworkandisusuallytheonlymachineina
clusterthatisequippedwithamonitorandkeyboard. Theheadnodeprovidesseveralvitalservicesto
therestofthecluster,suchascentraldatastorage,workloadmanagement,usermanagement,DNSand
DHCPservice. Theheadnodeinaclusterisalsofrequentlyreferredtoasthemasternode.
Often,theheadnodeisreplicatedtoasecondheadnode,frequentlycalledapassiveheadnode. If
theactiveheadnodefails,thepassiveheadnodecanbecomeactiveandtakeover. Thisisknownasa
highavailabilitysetup,andisatypicalconfiguration(Chapter15oftheAdministratorManual)inBCM.
A cluster normally contains a considerable number of non-head, or regular nodes, also referred to
simplyasnodes. Theheadnode,notsurprisingly,managestheseregularnodesoverthenetwork.
Mostoftheregularnodesarecomputenodes. Computenodesarethemachinesthatwilldotheheavy
workwhenaclusterisbeingusedforlargecomputations. Inadditiontocomputenodes,largerclusters
may have other types of nodes as well (e.g. storage nodes and login nodes). Nodes typically install
automatically through the (network bootable) node provisioning system that is included with BCM.
Every time a compute node is started, the software installed on its local hard drive is synchronized
automatically against a software image which resides on the head node. This ensures that a node can
alwaysbebroughtbacktoa“knownstate”. Thenodeprovisioningsystemgreatlyeasescomputenode
administrationandmakesittrivialtoreplaceanentirenodeintheeventofhardwarefailure. Software
changesneedtobecarriedoutonlyonce(inthesoftwareimage),andcaneasilybeundone. Ingeneral,
therewillrarelybeaneedtologontoacomputenodedirectly.
Inmostcases, aclusterhasaprivateinternalnetwork, whichisusuallybuiltfromoneormultiple
managedGigabitEthernetswitches,ormadeupofanInfiniBandorOmni-Pathfabric. Theinternalnet-
workconnectsallnodestotheheadnodeandtoeachother.Computenodesusetheinternalnetworkfor
booting,datastorageandinterprocesscommunication. Inmoreadvancedclustersetups,theremaybe

2.2ClusterStructure 21
severaldedicatednetworks. Itshouldbenotedthattheexternalnetwork—whichcouldbeauniversity
campusnetwork,companynetworkortheInternet—isnotnormallydirectlyconnectedtotheinternal
network. Instead,onlytheheadnodeisconnectedtotheexternalnetwork.
Figure2.1illustratesatypicalclusternetworksetup.
Figure2.1: Clusternetwork
Mostclustersareequippedwithoneormorepowerdistributionunits. Theseunitssupplypowerto
allcomputenodesandarealsoconnectedtotheinternalclusternetwork.Theheadnodeinaclustercan
usethepowercontrolunitstoswitchcomputenodesonoroff.Fromtheheadnode,itisstraightforward
topoweron/offalargenumberofcomputenodeswithasinglecommand.

3
Installing NVIDIA Base
Command Manager
ThischapterdescribesindetailtheinstallationofNVIDIABaseCommandManagerontotheheadnode
ofacluster. Sections3.1and3.2listhardwarerequirementsandsupportedhardware. Section3.3gives
step-by-step instructions on installing BCM from a DVD or USB drive onto a head node that has no
operating system running on it initially, while section 3.4 gives instructions on installing onto a head
nodethatalreadyhasanoperatingsystemrunningonit.
Once the head node is installed, the other, regular, nodes can (network) boot off the head node
and provision themselves from it with a default image, without requiring a Linux distribution DVD
orUSBdrivethemselves. Regularnodesnormallyhaveanyexistingdatawipedduringtheprocessof
provisioningfromtheheadnode,whichmeansthatafaultydrivecannormallysimplybereplacedby
taking the regular node offline, replacing its drive, and then bringing the node back online, without
specialreconfiguration. Thedetailsofthenetworkbootandprovisioningprocessfortheregularnodes
aredescribedinChapter5oftheAdministratorManual.
Theinstallationofsoftwareonanalready-configuredclusterrunningBCMisdescribedinChapter9
oftheAdministratorManual.
3.1 Minimal Hardware Requirements
The following are minimal hardware requirements, suitable for a cluster of one head node and two
regularcomputenodes:
3.1.1 HeadNode
• x86-64,orARMv8CPU
• Forrunningtheapplicationsoftware:
– 4GBRAMforthex86architecture1
– 16GBRAMfortheARMv8architecture,
• 80GBdiskspace
• 2GigabitEthernetNICs(forthemostcommonType1topology(section3.3.9))
• DVDdriveorUSBdrive
1Thevalueof4GBRAMforthex86headnode,whiletechnicallycorrectasaminimumforrunningtheapplication,isgen-
erallynotapracticalminimumwhencarryingoutastandardinstallation. Thisisbecausethestandardbare-metalinstallation
(section3.3)runsbestwithatleast8GBRAM.

24 InstallingNVIDIABaseCommandManager
3.1.2 ComputeNodes
• x86-64,ARMv8CPU
• 1GBRAM(atleast4GBisrecommendedfordisklessnodes)
• 1GigabitEthernetNIC
RecommendedhardwarerequirementsforlargerclustersarediscussedindetailinAppendixB.
3.2 Supported Hardware
An NVIDIA-certified for AI enterprise system is a system with NVIDIA GPUs and networking
that has passed a set of certification tests to validate its performance, reliability, and scale for
data centers. Many system builders that have partnered with NVIDIA can provide such certi-
fied hardware. These system builders are listed in https://www.nvidia.com/en-us/data-center/
data-center-gpus/qualified-system-catalog.
Thefollowinghardwareisalsosupported,evenifitmaynotbeNVIDIA-certifiedforAIEnterprise:
3.2.1 ComputeNodes
• ASUS
• Atos
• Cisco
• DellEMC
• Fujitsu
• HPE(HewlettPackardEnterprise)
• IBM
• Lenovo
• NVIDIADGX
• Oracle
• Supermicro
Otherbrandsarealsoexpectedtowork,evenifnotexplicitlysupported.
3.2.2 EthernetSwitches
• Cisco
• Dell
• HPNetworkingSwitches
• Netgear
• Supermicro
Otherbrandsarealsoexpectedtowork,althoughnotexplicitlysupported.
3.2.3 PowerDistributionUnits
• APC(AmericanPowerConversion)SwitchedRackPDU
OtherbrandswiththesameSNMPMIBmappingsarealsoexpectedtowork,althoughnotexplicitly
supported.

3.3HeadNodeInstallation: BareMetalMethod 25
3.2.4 ManagementControllers
• HPiLO
• iDRAC
• IPMI1.5/2.0
• CIMC
• Redfishv1
3.2.5 InfiniBandAndSimilar
• NVIDIA(formerlyMellanox)HCAs,andmostotherInfiniBandHCAs
• NVIDIA(formerlyMellanox),andmostotherInfiniBandswitches
3.2.6 GPUs
• NVIDIAGPUslaterthanVolta,withlatestrecommendeddrivers
• NVIDIADGXOS7
• AMD Radeon GPUs, as listed at https://support.amd.com/en-us/kb-articles/Pages/
Radeon-Software-for-Linux-Release-Notes.aspx
TheGPUsthatareNVIDIA-certifiedforAIEnterprisearelistedinthesupportmatrixathttps://docs.
nvidia.com/ai-enterprise/latest/product-support-matrix/index.html#support-matrix.
3.2.7 RAID
SoftwareorhardwareRAIDaresupported. FakeRAIDisnotregardedasaseriousproductionoption
andissupportedaccordingly.
3.3 Head Node Installation: Bare Metal Method
A bare metal installation, that is, installing the head node onto a machine with no operating system
on it already, is the recommended option. This is because it cannot run into issues from an existing
configuration. Anoperatingsystemfromoneoftheoneslistedinsection2.1isinstalledduringabare
metalinstallation. Thealternativetoabaremetalinstallationistheadd-oninstallationofsection3.4.
Justtobeclear,abaremetalinstallationcanbeaphysicalmachinewithnothingrunningonit,but
itcanalsoabevirtualmachine–suchasaVMware,VirtualBox,orKVMinstance–withnothingrunning
on it. Virtual instances may need some additional adjustment to ensure virtualization-related settings
are dealt with correctly. Details on installing BCM onto virtual instances can be found in the BCM
KnowledgeBaseathttp://kb.brightcomputing.com.
Tostartaphysicalbaremetalinstallation,thetimeintheBIOSoftheheadnodeissettolocaltime.
The head node is then made to boot from DVD or USB, which can typically be done by appropriate
keystrokeswhentheheadnodeboots,orviaaBIOSconfiguration.
SpecialstepsforinstallationfromabootableUSBdevice: IfabootableUSBdeviceistobeused,then
theinstructionswithintheBCMISO,inthefileREADME.BRIGHTUSBshouldbefollowedtocopytheISO
image over to the USB device. After copying the ISO image, the MD5 checksum should be validated
toverifythatthecopiedISOisnotcorrupt. Thisisimportant, becausecorruptionispossibleinsubtle
waysthatmayaffectoperationslateron,andinwaysthataredifficulttouncover.

26 InstallingNVIDIABaseCommandManager
3.3.1 ISOBootMenu
If booting from a DVD or USB drive, then a pre-installer menu called the ISO boot menu first loads up
(figure3.1).
Figure3.1: Installation: ISOBootMenu
The ISO Boot menu offers a default option of booting from the hard drive, with a countdown to
starting the hard drive boot. To install BCM, the countdown should be interrupted by selecting the
optionof“Start Base Command Manager Graphical Installer”instead.
Selectingtheoptionallowskernelparameteroptionstobeprovidedtotheinstaller.
Defaultkernelparameteroptionsareprovidedsothattheadministratorcansimplypresstheenter
keytogostraightontostarttheinstaller,andbringupthewelcomescreen(section3.3.2).
Optional: ThenetconfCustomKernelParameter
Anon-defaultkernelparameteroptionisnetconf. Settingconfigurationvaluesforthisoptionconfig-
ures login and network settings for the cluster manager, and also means that SSH and VNC servers
arelaunchedasthewelcomescreen(section3.3.2)oftheBCMinstallerstartsup. Thisthenallowsthe
clusteradministratortocarryoutaremoteinstallation,insteadofhavingtoremainattheconsole.
ThenetconfoptioncanbesetforboththeGUIandtextinstallerinstallation.
Thenetconfcustomkernelparameterrequires3settings:
1. asettingfortheexternalnetworkinterfacethatistobeused. Forexample: eth0oreth1.
2. asettingforthenetworkconfigurationoftheexternalnetwork,tobeexplainedsoon.Thenetwork
configurationoptioncanbebuilteitherusingstaticIPaddressingorwithDHCP.
• ForstaticIPaddressing,thenetworkconfigurationformatiscomma-separated:
static:<IPaddress>,<gatewayaddress>,<netmask>
• ForDHCPaddressing,theformatissimplyspecifiedusingthestringdhcp.
3. a setting for the password, for example secretpass, for the login to the cluster manager that is
abouttobeinstalled.
Example
WithstaticIPaddressing:
netconf=eth0:static:10.141.161.253,10.141.255.254,255.255.0.0:secretpass
Example
WithDHCPaddressing:
netconf=eth0:dhcp:secretpass
A remote installation can alternatively be carried out later on without setting netconf, by using
the text mode installer to set up networking (section 3.5), or by using GUI mode installer Continue
remotelyoption(figure3.3).

3.3HeadNodeInstallation: BareMetalMethod 27
3.3.2 WelcomeScreen
Thewelcomescreenisshowninfigure3.2.
Figure3.2: InstallationwelcomescreenforBCM
AnadministratorwhowouldliketosimplystartinstallationcanclickontheStart installation
buttonattheleftsideofthescreen.
3.3.3 SoftwareLicenses
ThenextscreenthatisdisplayedaskstheusertoreadandagreetotheNVIDIASoftwareLicenceAgree-
ment(figure3.3):

28 InstallingNVIDIABaseCommandManager
Figure3.3: NVIDIABaseCommandManagerSoftwareLicenseAgreement
TheagreementiscarriedoutbytickingthecheckboxandclickingontheNextbutton.
Another license agreement screen after that asks the user to agree to the Base Distribution license.
Thisistheenduserlicenseagreementforthedistribution(RHEL,Rocky, Ubuntuandsoon)thatisto
beusedasthebaseuponwhichBCMistorun.
OptionsInGUIDuringTheInstallationScreens
Asisseeninfigure3.3,themainscreensduringinstallationhavethefollowingclickableoptionsalong
thebottomofthescreen:
• Load config: allowsanexistingconfigurationfiletobeloadedandusedbytheinstallation. This
optionisavailableonlyduringthefirstfewscreens.
• Show config: allowsanyalreadyloadedconfigurationfiletobedisplayed. Thereisadefaultcon-
figurationloadedbydefault,withvaluesthatmaysuittheclusteralready. However,thedefaults
arenotexpectedtobeoptimal,andmaynotevenworkfortheactualphysicalconfiguration.
• Continue remotely: allows the administrator to leave the console and access the cluster from a
remotelocation. Thiscanbeusefulforadministratorswho,forexample,prefertoavoidworking
inside a noisy cold data center. If Continue remotely is selected, then addresses are displayed
on the console screen, for use with a web browser or SSH, and the console installation screen is
locked.
• Back: ifnotgrayedout,theBackoptionallowstheadministratortogobackastepintheinstalla-
tion.

3.3HeadNodeInstallation: BareMetalMethod 29
• Next: allowstheadministratortoproceedtothenextscreen.
ConsoleAndLogAccessDuringInstallation
Theclusteradministratorcangetarootconsoleandviewloggingbygoingthroughthevirtualterminals.
ForUbuntuandRockytheterminalsshouldbeallocatedasfollows:
• Ctrl+Alt+F1: Rootshell
• Ctrl+Alt+F2: Installer(GUI/TUI)
• Ctrl+Alt+F3: Logging(atleastonRocky/RHEL)
• Ctrl+Alt+F5+: Additionalshells
Theallocationmaychange.
3.3.4 KernelModulesConfiguration
TheKernel Modulesscreen(figure3.4)showsthekernelmodulesrecommendedforloadingbasedon
ahardwareprobe:
Figure3.4: KernelModulesRecommendedForLoadingAfterProbing
Changestothemodulestobeloadedcanbeenteredbyreorderingtheloadingorderofmodules,by
removingmodules,andaddingnewmodules. Clickingthe(cid:13)+ buttonopensaninputboxforaddinga
modulenameandoptionalmoduleparameters(figure3.5). Themodulecanbeselectedfromabuilt-in;
itcanbeautomaticallyextractedfroma.debor.rpmpackage;oritcansimplybeselectedbyselecting
anavailable.kokernelmodulefilefromthefilesystem.

30 InstallingNVIDIABaseCommandManager
Amodulecanalsobeblacklisted, whichmeansitispreventedfrombeingused, byclickingonthe
(cid:11)button. Thiscanbeusefulwhenreplacingonemodulewithanother.
Figure3.5: AddingKernelModules
ClickingNextthenleadstothe“Hardware info”overviewscreen,describednext.
3.3.5 HardwareInfo
TheHardware Infoscreen(figure3.6)providesanoverviewofdetectedhardwarebasedonthehard-
ware probe used to load kernel modules. If any hardware is not detected at this stage, then the Back
buttoncanbeusedtogobacktotheKernel Modulesscreen(figure3.4)toaddtheappropriatemodules,
andthentheHardware Informationscreencanbereturnedto,toseeifthehardwarehasbeendetected.

3.3HeadNodeInstallation: BareMetalMethod 31
Figure3.6: HardwareOverviewBasedOnHardwareDetectionUsedForLoadingKernelModules
ClickingNextintheHardware InfoscreenleadstotheInstallation sourceconfigurationscreen,
describednext.
3.3.6 InstallationSource
Theinstallationsourcescreen(figure3.7)detectstheavailableDVD-ROMdevices.

32 InstallingNVIDIABaseCommandManager
Figure3.7: DVDSelection
Theadministratormustselectthecorrectdevicetocontinuetheinstallation.
Optionally,amediaintegritycheckcanbeset.
ClickingontheNextbuttonstartsthemediaintegritycheck,ifitwasset. Themediaintegritycheck
cantakeaboutaminutetorun. Ifalliswell,thenthe“Cluster settings”setupscreenisdisplayed,as
describednext.
3.3.7 ClusterSettings
TheGeneral cluster settingsscreen(figure3.8)providesanoverviewofsomemandatoryandop-
tionalsettings.

3.3HeadNodeInstallation: BareMetalMethod 33
Figure3.8: Generalclustersettings
Settingsthatcanbeprovidedinthisscreenare:
• Cluster name
• Administrator email: Wheremailtotheadministratorgoes. Thisneednotbelocal.
• Time zone
• Time servers: The defaults are pool.ntp.org servers. A time server is recommended to avoid
problemsduetotimediscrepanciesbetweennodes.
• Nameservers: OneormoreDNSserverscanbeset.
• Search domains: Oneormoredomainscanbeset.
• Environment modules: TraditionalTclmodulesaresetbydefault. Lmodisanalternative.
3.3.8 WorkloadManagementConfiguration
The“Workload manager”configurationscreen(figure3.9)allowsasupportedworkloadmanagertobe
selected. A workload management system is highly recommended to run multiple compute jobs on a
cluster.

34 InstallingNVIDIABaseCommandManager
Figure3.9: WorkloadManagementSetup
Ifnoworkloadmanagerisselectedhere,thenitcanbeinstalledlateron,aftertheclusterinstallation
without the workload manager has been done. Details on installing a workload manager later on are
giveninChapter7onworkloadmanagementoftheAdministratorManual.
Thedefaultclientslotnumberthatissetdependsontheworkloadmanagerchosen.
• IfPBSProfessionalorOpenPBSisselectedasaworkloadmanagementsystem, thenthenumber
ofclientslotsdefaultsto1. Aftertheinstallationiscompletedtheadministratorshouldupdatethe
valueinthepbsproclientroletothedesirednumberofslotsforthecomputenodes.
• For all other workload management systems, the number of client slots is determined automati-
cally.
Theheadnodecanalsobeselectedforrunningjobs,therebyactingasanadditionalcomputenode.
Thiscanbeasensiblechoiceonsmallclustersiftheheadnodecansparesuchresources.
ClickingNextonthisscreenleadstotheNetwork topologyscreen.
3.3.9 NetworkTopology
Regularnodesarealwayslocatedonaninternalnetwork,bydefaultcalledInternalnet.
The Network Topology screen allows selection of one of three different network topologies (fig-
ures3.10,3.11,3.12):

3.3HeadNodeInstallation: BareMetalMethod 35
Figure3.10: NetworksTopology: Type1networkselection
Atype1network: hasitsnodesconnectedonaprivateinternalnetwork. Thisisthedefaultnet-
work setup. In this topology, a network packet from a head or regular node destined for any
externalnetworkthattheclusterisattachedto,bydefaultcalledExternalnet,canonlyreachthe
external network by being routed and forwarded at the head node itself. The packet routing for
Externalnetisconfiguredattheheadnode.
Atype1networkisthemostcommonandsimplewaytorunthecluster. Itmeansthatthehead
nodeprovidesDHCPandPXEservices(duringpre-initstagenodebootingonly)toasecondary,
isolated network for the worker nodes, segregating the cluster traffic. The external (typically a
corporate)networkisthenonlyusedtoprovideaccesstotheheadnode(s)formanagement.
One limitation is that broader network access must be provided through routing or via a proxy,
shouldanyoneoutsideoftheclusternetworkneedtoaccessanode.

36 InstallingNVIDIABaseCommandManager
Figure3.11: NetworksTopology: Type2networkselection
A type 2 network: has its nodes connected via a router to a public network. In this topology,
a network packet from a regular node destined for outside the cluster does not go via the head
node,butusestheroutertoreachapublicnetwork.
Packetsbetweentheregularnodesandtheheadnodehoweverstillnormallygodirectlytoeach
other, including the DHCP/PXE-related packets during pre-init stage node booting, since in a
normalconfigurationtheregularnodesandheadnodeareonthesamenetwork.
Anyroutingforbeyondtherouterisconfiguredontherouter,andnotontheclusteroritsparts.
Care should be taken to avoid conflicts between the DHCP server on the head node and any
existing DHCP server on the internal network, if the cluster is being placed within an existing
corporate network that is also part of Internalnet (there is no Externalnet in this topology).
Typically,inthecasewheretheclusterbecomespartofanexistingnetwork,thereisanotherrouter
configured and placed between the regular corporate machines and the cluster nodes to shield
themfromeffectsoneachother.
Atype2networkdoesnotisolatetheworkernodesfromthenetworkaboveit. Instead,eachnode
remainsreachablethroughthemaindataplane. Thisisusefulforclustershostingservices, such
asawebportal,avoidingtheuseofproxies.

3.3HeadNodeInstallation: BareMetalMethod 37
Figure3.12: NetworksTopology: Type3networkselection
Atype3network: hasitsnodesconnectedonaroutedpublicnetwork. Inthistopology,anetwork
packetfromaregularnode,destinedforanothernetwork,usesaroutertogettoit.Theheadnode,
beingonanothernetwork,canonlybereachedviaaroutertoo.Thenetworktheregularnodesare
oniscalledInternalnetbydefault,andthenetworktheheadnodeisoniscalledManagementnet
bydefault. AnyroutingconfigurationforbeyondtheroutersthatareattachedtotheInternalnet
andManagementnetnetworksisconfiguredontherouters,andnotontheclustersoritsparts.
A consequence of using a router in the type 3 configuration is that the communication between
the head node and the regular nodes is via OSI layer 3. So, OSI layer 2 used by DHCP is not
directly supported. However, DHCP/PXE packets still need to be exchanged between the head
andregularnodesduringpre-initnodeboot. TheusualwaytorelaythepacketsisusingaDHCP
relayagent. ConfigurationofaDHCPrelayagentisoutsidethescopeofBCMconfiguration,and
istypicallydonebythenetworkadministratorortheroutervendor.
For a type 2 network, a DHCP relay agent may also be needed if the regular nodes are spread
acrossseveralsubnets.
Selecting the network topology helps decide the predefined networks on the Networks settings
screenlater(figure3.16). ClickingNexthereleadstotheHead node settingsscreen,describednext.
3.3.10 HeadNodeSettings
Theheadnodesettingsscreen(figure3.13)canbeusedtoset,fortheheadnode:
• thehostname

38 InstallingNVIDIABaseCommandManager
• thepassword
• thehardwaremanufacturer
Figure3.13: Headnodesettings
ClickingNextleadstotheCompute node settingsscreen,describednext.
3.3.11 ComputeNodesSettings
Thecomputenodessettingsscreen(figure3.14)canbeusedtoset,forthecomputenodes:
• thenumberofracksusedtohostthenodes
• thenumberofnodes
• thenamingformatforthenodes. Thisconsistsof:
– thenodebasename(default: node)
– thenodestartnumber(default: 1)
– thenodedigits(default: 3)
By default therefore, the first compute node takes the name node001, the second compute node
takesthenamenode002,andsoon.
• thehardwaremanufacturer

| 3.3HeadNodeInstallation: | BareMetalMethod | 39  |
| ------------------------ | --------------- | --- |
Figure3.14: Computenodesettings
| ClickingNextleadstotheBMC | configurationscreen,describednext. |     |
| ------------------------- | ---------------------------------- | --- |
3.3.12 BMCConfiguration
The BMC (Baseboard Management Controller) screen (figure 3.15) configures BMCs compatible with
IPMI,iDRAC,iLO,orCIMC.
TheBMCscanbeconfiguredfortheheadorcomputenodes.

40 InstallingNVIDIABaseCommandManager
Figure3.15: BMCconfiguration
IftheadministratorconfirmsthatthenodesaretouseBMCs(BaseboardManagementControllers)
thatarecompatiblewithIPMI,iLO,CIMC,iDRAC,orRedfish,thentheBMCnetworkoptionsappear.
Bydefault,forthecomputenodes,theBMCisautomaticallyconfigured.
For a Type 1 network, the head node BMC is often connected to an ethernet segment that has the
external network running on it, while the BMCs on the compute nodes are normally connected to an
ethernetsegmentthathastheinternalnetworkonit.
Onceanetworkassociatedwiththeethernetsegmentischosen, itmeansthatfurtherBMC-related
networkingvaluescanbesetfortheBMCs.
AnewLayer3IPsubnetcanbecreatedforBMCinterfaces.
TheBMCinterfacecanbeconfiguredasasharedphysicalinterfacewithanalreadyexistingnetwork
interface.HoweverthiscaninsomecasescauseproblemsduringearlysystemBIOSchecks.Adedicated
physicalBMCinterfaceisthereforerecommended.
IfaBMCisconfigured,thentheBMCpasswordissettoarandomvalue. Retrievingandchanginga
BMCpasswordiscoveredinsection3.7.2oftheAdministratorManual. BMCconfigurationisdiscussed
furtherinsection3.7oftheAdministratorManual.
ClickingNextleadstotheNetworksscreen,describednext.
3.3.13 Networks
The Networks configuration screen (figure 3.16) displays the predefined list of networks, based on the
selectionofnetworktopologyandBMCnetworksmadeintheearlierscreens.

3.3HeadNodeInstallation: BareMetalMethod 41
Figure3.16: Networksconfiguration,internalnettab
TheNetworksconfigurationscreenallowstheparametersofthenetworkinterfacestobeconfigured
viatabsforeachnetwork. InadditiontoanyBMCnetworks:
Foratype1setup,anexternalnetworkandaninternalnetworkarealwaysdefined.
Foratype2setup,aninternalnetworkisdefinedbutnoexternalnetworkisdefined.
Foratype3setup,aninternalnetworkandamanagementnetworkaredefined.
Thus,foratype1network,forexample,thenetworkingdetails:
• forexternalnetcorrespondtothedetailsoftheheadnodeexternalnetworkinterface.
• forinternalnetcorrespondtothedetailsofhowthecomputenodesareconfigured.
• foraBMCnetworkcorrespondtothedetailsofhowtheBMCisconnected
AdditionalcustomnetworkscanbeaddedintheNetworksconfigurationscreenbyclickingonthe
(cid:13)+ button.
Clicking Next in this screen validates all network settings. Invalid settings for any of the defined
networks cause an alert to be displayed, explaining the error. A correction is then needed to proceed
further. Settingsmayofcoursebevalid,butincorrect—thevalidationismerelyasanitycheck. Itmay
be wise for the cluster administrator to check with the network specialist that the networks that have
beenconfiguredaresetupasreallyintended.
Ifallsettingsarevalid,thentheNextbuttonbringstheinstallationontotheHead node interfaces
screen,describednext.

42 InstallingNVIDIABaseCommandManager
3.3.14 Headnodeinterfaces
The Head node interfaces screen (figure 3.17) allows a review of the head node network interfaces
andtheirproposedsettings.
Figure3.17: Headnodeinterfacesconfiguration
If a BMC network is to be shared with a regular network, then an alias interface is shown too. In
figure3.17analiasinterface,ens3:ipmi,isshown.
Interfacescanbecreatedorremoved.
Dropdownselectionallowstheproposedvaluestobechanged. Itispossibletoswapnetworkinter-
faceswithdropdownselection.
Clicking the Next button brings the installation on to the Compute node interfaces screen, de-
scribednext.
3.3.15 Computenodeinterfaces
TheCompute node interfacesscreen(figure3.18)allowsareviewofthecomputenodenetworkinter-
facesandtheirproposedsettings.

3.3HeadNodeInstallation: BareMetalMethod 43
Figure3.18: Computenodeinterfacesconfiguration
ThebootinterfaceBOOTIFisusedtopickuptheimageforthenodevianodeprovisioning.
TheIPoffsetisusedtocalculatetheIPaddressassignedtoaregularnodeinterface. Thenodesare
convenientlynumberedinasequence,sotheirinterfacesaretypicallyalsogivenanetworkIPaddress
that is in a sequence on a selected network. In BCM, interfaces by default have their IP addresses
assignedtothemsequentially,instepsof1,startingafterthenetworkbaseaddress.
The default IP offset is 0.0.0.0, which means that the node interfaces by default start their range at
theusualdefaultvaluesintheirnetwork.
With a modified IP offset, the point at which addressing starts is altered. For example, a different
offsetmightbedesirablewhennoIPMInetworkhasbeendefined,butthenodesoftheclusterdohave
IPMIinterfacesinadditiontotheregularnetworkinterfaces. IfamodifiedIPoffsetisnotsetforoneof
theinterfaces,thentheBOOTIFandipmi0interfacesgetIPaddressesassignedonthesamenetworkby
default,whichcouldbeconfusing.
However, if an offset is entered for the ipmi0 interface, then the assigned IPMI IP addresses start
fromtheIPaddressspecifiedbytheoffset. Thatis,eachmodifiedIPMIaddresstakesthevalue:
addressthatwouldbeassignedbydefault+IPoffset
Example
TakingthecasewhereBOOTIFandIPMIinterfaceswouldhaveIPaddressesonthesamenetworkwith
thedefaultIPoffset:
Then,onaclusterof10nodes,amodifiedIPMIIPoffsetof0.0.0.20means:
• theBOOTIFinterfacesstayon10.141.0.1,...,10.141.0.10while

44 InstallingNVIDIABaseCommandManager
• theIPMIinterfacesrangefrom10.141.0.21,...,10.141.0.30
ClickingtheNextbuttonbringstheinstallationontotheDisk layoutscreen,describednext.
3.3.16 DiskLayout
IntheDisk layoutconfigurationscreen(figure3.19)theadministratormustselectthedriveonthehead
nodewheretheBCMsoftwareistobeinstalled.
Figure3.19: Disklayoutscreen
3.3.17 DiskLayoutSettings
ThenextscreenistheDisk layout settingsconfigurationscreen(figure3.20).

3.3HeadNodeInstallation: BareMetalMethod 45
Figure3.20: Disklayoutsettingsscreen
Itisusedtosetthepartitioninglayouts. ThepartitioninglayoutXMLschemaisdescribedindetail
inAppendixDoftheAdministratorManual.
The administrator must set the disk partitioning layout for the head node and regular nodes with
thetwooptions: Head node disk layoutandCompute nodes disk layout.
• – Theheadnodebydefaultuses
* onebigpartitionifithasadrivesizesmallerthanabout500GB
* severalpartitionsifithasadrivesizegreaterthanorequaltoabout500GB.
– Thecomputenodebydefaultusesseveralpartitions,usingtheDefault Standard Layout.
A partitioning layout other than the default can be selected for installation from the drop-down
optionsfortheheadnodeandregularnodes.PossiblepartitioningoptionsincludeRAID,failover,
STIG-compliant,andLUKSschemes.
• The iconcanbeclickedtoallowacustompartitioninglayoutspecificationtobeadded:
– asafile
– fromthedefaulttemplate,foruseasastartingpointforaspecification
• Partitioning layouts can be edited with the icon. This brings up a screen (figure 3.21) that
allowstheadministratortoviewandchangelayoutvalueswithinthelayout’sconfigurationXML
file:

46 InstallingNVIDIABaseCommandManager
Figure3.21: EditDiskPartitioning
TheXMLschemaisdescribedinAppendixD.1oftheAdministratorManual.
• The head node partitioning layout is the only installation setting that cannot easily be changed
afterthecompletion(section3.3.20)ofinstallation. Itshouldthereforebedecideduponwithcare.
• Bydefault,BCMmountsfilesystemsontheheadnodewithACLssetandextendedattributesset.
• The XML schema allows the definition of a great variety of layouts in the layout’s configuration
XMLfile:
Example
1. for a large cluster or for a cluster that is generating a lot of monitoring or burn data, the
default partition layout partition size for /var may fill up with log messages because log
messages are usually stored under /var/log/. If /var is in a partition of its own, as in the
defaultheadnodepartitioninglayoutpresentedwhentheharddriveisabout500GBormore,
thenprovidingalargersizeofpartitionthanthedefaultfor/varallowsmoreloggingtotake
placebefore/varisfull. Modifyingthevaluefoundwithinthe<size></size>tagsassociated
withthatpartitionintheXMLfilemodifiesthesizeofthepartitionthatistobeinstalled.This
canbeconvenientlydonefromthefrontendshowninfigure3.21.
2. the administrator could specify the layout for multiple non-RAID drives on the head node
usingone<blockdev></blockdev>tagpairwithinanenclosing<device></device>tagpairfor
eachdrive.
3. Fornon-bootpartitions,itispossibletosetupLUKSencrypteddiskpartitionsonheadand
regularnodes. ScrollingthroughthePartition Propertiescolumnoffigure3.21,andtick-
ing the Enable encryption checkbox, makes the LUKS configuration parameters available
(figure3.22):

3.3HeadNodeInstallation: BareMetalMethod 47
Figure3.22: DiskEncryptionConfiguration
Theparameterscanbeleftattheirdefaultvaluestosetupanencryptedpartition.
If setting parameters, then there are some existing fields to set the more common parame-
ters. Settings for less-common parameters that have no existing fields can be specified and
appendedtothefieldwiththeAdditional Parameters: setting.
ThesettingsareautomaticallystoredintheXMLspecificationforthedisklayoutandcanbe
viewedtherebyselectingtheXML Outputtab.
Howaclusteradministratorappliesthisconfigureddiskencryptiontoanodethatisbooting
upiscoveredinAppendixD.17oftheAdministratorManual.
ClickingNextontheDisk layoutscreenleadstotheAdditional softwarescreen,describednext.
3.3.18 AdditionalSoftware
TheAdditional softwarescreen(figure3.23)displayssoftwarethatcanbeaddedtotheclusterifitwas
provided with the installer. The software is only provided to the installer if selected when generating
theinstallerISO.CUDAisapossibleadditionalsoftware.
IfNVIDIAAIEnterpriseistobeused,thentheseoptionsmustnotbeselected.

48 InstallingNVIDIABaseCommandManager
Figure3.23: Additionalsoftwarescreen
ClickingNextontheAdditional softwarescreenleadstotheSummaryscreen,describednext.
3.3.19 Summary
The Summary screen (figure 3.24), summarizes some of the installation settings and parameters config-
uredduringthepreviousstages.

3.3HeadNodeInstallation: BareMetalMethod 49
Figure3.24: SummaryofInstallationSettings
Goingbacktocorrectvaluesisstillpossibleatthisstage.
ClickingontheNextbuttonleadstothe“Deployment”screen,describednext.
3.3.20 Deployment
TheDeploymentscreen(figure3.25)showstheprogressofthedeployment. Itisnotpossibletonavigate
backtopreviousscreensoncetheinstallationhasbegun. Theinstallationlogcanbeviewedindetailby
clickingonInstall log.
The Reboot button restarts the machine. Alternatively, the head node can be set to automatically
rebootwhendeploymentiscomplete.
Duringthereboot,theBIOSbootordermayneedchanging,ortheDVDmayneedtoberemoved,in
ordertobootfromtheharddriveonwhichBCMhasbeeninstalled.

50 InstallingNVIDIABaseCommandManager
Figure3.25: Deploymentcompleted
Afterrebooting,thesystemstartsandpresentsaloginprompt. Theclusteradministratorcanlogin
asrootusingthepasswordthatwassetduringtheinstallationprocedure.
Theclustershouldthenbeupdatedwiththelatestpackages(Chapter9oftheAdministratorManual).
Afterthelatestupdateshavebeeninstalled,thesystemisreadytobeconfigured.
3.3.21 LicensingAndFurtherConfiguration
The administrator with no interest in the add-on method of installation can skip on to installing the
license (Chapter 4). After that, the administrator can look through the Administrator Manual, where
toolsand conceptsusedwith BCMareintroduced, so thatfurthercluster configurationcanbe carried
out.
3.4 Head Node Installation: Ansible Add-On Method
An add-on installation, in contrast to the bare metal installation (section 3.3), is an installation that is
done onto a machine that is already running one of the supported distributions of section 2.1. The
installationofthedistributioncanthereforebeskippedforthiscase. Theadd-onisnotrecommended
forinexperiencedclusteradministrators. Thisisbecauseofthefollowingreasons:
• The installation configuration may conflict with what has already been installed. The problems
that arise can always be resolved, but an administrator that is not familiar with BCM should be
preparedfortroubleshooting.
• Additionalrepositoriestypicallyneedtobeadded

3.4HeadNodeInstallation: AnsibleAdd-OnMethod 51
• Dependencyanddeprecatedissuesmayneedworkarounds.
• ResolvinganissueduetoacustomconfigurationintheOSdistributionimageisoutsidethescope
ofstandardsupport.
UsingtheheadnodeinstallerAnsiblecollectionistherecommendedmethodforcarryingoutadd-on
installations.
Aside: AnsiblecanalsobeusedwithBCMonceNVIDIABaseCommandManagerisinstalled. This
integrationisdescribedinsection14.10oftheAdministratorManual.
3.4.1 AnOverviewOfAnsible
Ansibleisapopularautomatedconfigurationmanagementsoftware.
The BCM administrator is expected to have some experience already with Ansible. The basic con-
ceptsarecoveredintheofficialAnsibledocumentationathttps://docs.ansible.com/ansible/latest/
user_guide/basic_concepts.html,andfurtherdetailsareaccessiblefromthatsitetoo.
Asareminder:
• Ansibleisdesignedtoadministergroupsofmachinesfromaninventoryofmachines.
• An Ansible module is code, usually in Python, that is executed by Ansible to carry out Ansible
tasks,usuallyonaremotenode. Themodulereturnsvalues.
• An Ansible playbook is a YAML file. The file declares a configuration that is to be executed (“the
playbook is followed”) on selected machines. The execution is usually carried out over SSH, by
placingmodulesontheremotemachine.
• Traditionally, officialAnsiblecontentwasobtainedasapartofmilestonereleasesofAnsibleEn-
gine,(theRedHatversionofAnsiblefortheenterprise).
• SinceAnsibleversion2.10,theofficialwaytodistributecontentisviaAnsiblecontentcollections.
CollectionsarecomposedofAnsibleplaybooks, modules, moduleutilitiesandplugins. Thecol-
lectionisaformattedsetoftoolsusedtoachieveautomationwithAnsible.
• The official Ansible list of collections is at https://docs.ansible.com/ansible/latest/
collections/index.html#list-of-collections. At the time of writing of this section (March
2022)therewere100collections.
• Community-supportedcollectionsarealsoavailable,atgalaxy.ansible.com.
3.4.2 TheHeadNodeAdd-onInstallerAndAnsible
TheheadnodeinstallerisshippedasanAnsiblecollection. Ifthecorrectparametersaredefinedinthe
user’s playbooks and roles, then the collection defines brightcomputing.installer.head_node. The
brightcomputing.installer.head_nodedeploystheBCMheadnodeontothesupporteddistribution,
The head node installation also includes deployment of the default software image and node-
installer image components, which is required for provisioning compute nodes. Using the head node
installercollectionrequirespracticalknowledgeofAnsibleandBCM.Add-ondeploymentissupported
onbothbare-metalandpubliccloud(AWSandAzure).
LocationsForTheHeadNodeAdd-onInstaller
• https://galaxy.ansible.com/ui/repo/published/brightcomputing/installer110/istheof-
ficialAnsibleGalaxylocationfordetaileddocumentationabouttheheadnodeinstallercollection
anditsusage.
• https://github.com/Bright-Computing/bright-installer-ansible/tree/main/playbooks
containsadditionaldocumentationandexampleplaybooks.

52 InstallingNVIDIABaseCommandManager
3.5 Enabling Remote Browser-Based Installation Via The Text Mode Installer
Whencarryingoutaninstallationasinsection3.3,theinstallerisnormallyrunonthemachinethatisto
betheheadnodeofthecluster. AtextmodeinstallerispresentedasanalternativetotheGUIinstaller
(figure3.1).
ThetextmodeinstallerisaveryminimalinstallercomparedwiththeGUIinstaller. TheGUIinstal-
lationisthereforeusuallypreferred.
However, insomecasestheGUIinstallationcanfailtostart. Forexample, ifXisnotworkingcor-
rectlyforsomereasonontheheadnode.
AwaytostillrunaGUIinstallationisthentofirstrunthetextmodeinstaller,anduseittorunthe
Remote Installoptionfromitsmainmenu(figure3.26):
Figure3.26: ncursesRemoteInstallationOption
This then sets up network connectivity, and provides the cluster administrator with a remote URL
(figure3.27):
Figure3.27: ncursesRemoteInstallationRemoteURLDisplayed
Abrowserthatisonamachinewithconnectivitytotheheadnodecanthenusetheprovidedremote
URL.ThisthenbringsuptheGUIinstallerwithinthebrowser.
An alternative to running the text mode installer to obtain the remote URL is to use the netconf
kernelparameterinstead. Detailsonconfiguringthisaregiveninsection3.3.1.

4
Licensing NVIDIA Base
Command Manager
ThischapterexplainshowanNVIDIABaseCommandManagerlicenseisviewed,verified,requested,
andinstalled. Theuseofaproductkeytoactivatethelicenseisalsoexplained.
Typically,foranewclusterthatispurchasedfromareseller,theclusterhasBCMalreadysetupon
it.
• BCM can be run with a temporary, or evaluation license, which allows the administrator to try it
out. Thistypicallyhassomerestrictionsontheperiodofvalidityforthelicense,orthenumberof
nodesorGPUsinthecluster.
– The default evaluation license comes with the online ISO download. The ISO is available
forproductkeyownersviahttp://customer.brightcomputing.com/Download. Thelicense
thatisshippedwiththeISOallowsuptotwonodestobeused.Itcanbeusedforaheadnode
anduptoonecomputenode,oritcanbeusedwithtwoheadnodes. Clustersthatrunwith
this license do not qualify for support beyond the basic installation of Chapter 3. The idea
behindthislicenseisthattheinstalledBCMsoftwarethenallowsinstallationofanevaluation
licensewithgreaterprivileges,oranotherfulllicense.
– A custom evaluation license can be set up by the NVIDIA sales team and configured for
anagreed-uponnumberofGPUsandanagreed-uponvalidityperiod, typicallyfrom1to3
months.
• Incontrasttoanevaluationlicense, thereisthefulllicense. Afulllicenseisalmostalwaysasub-
scription license. Installing a full license allows BCM to function without the restrictions of an
evaluationlicense. Theadministratorthereforeusuallyrequestsafulllicense,andinstallsit. This
normallyonlyrequirestheadministratorto:
– Havetheproductkeyathand
– Runtherequest-licensescriptontheheadnode
Theprecedingtakescareofthelicensingneedsformostadministrators,andtherestofthischapter
canthenusuallyconvenientlybeskipped.
Administrators who would like a better background understanding on how licensing is installed
andusedinBCMcangoontoreadtherestofthischapter.
CMDaemoncanrunonlywithanunexpiredevaluationorunexpiredfulllicense. CMDaemonisthe
engine that runs BCM, and is what is normally recommended for further configuration of the cluster.
BasicCMDaemon-basedclusterconfigurationiscoveredinChapter3oftheAdministratorManual.
AnyBCMinstallationrequiresalicensefiletobepresentontheheadnode. Thelicensefiledetailsthe
attributesunderwhichaparticularBCMinstallationhasbeenlicensed.

54 LicensingNVIDIABaseCommandManager
Example
• The“Licensee”details,whichincludethenameoftheorganization,isanattributeofthelicense
filethatspecifiestheconditionthatonlythespecifiedorganizationmayusethesoftware.
• The “Licensed tokens” attribute specifies the maximum number of GPUs that the cluster man-
agermaymanage. Thisisalsothemaximumnumberofnodesthatthelicensecovers. Headnodes
arealsoregardedasnodesforthisattribute.
• The“Expiration date”ofthelicenseisanattributethatsetswhenthelicenseexpires. Itissome-
times set to a date in the near future so that the cluster owner effectively has a trial period. A
newlicensewithalongerperiodcanberequested(section4.3)aftertheownerdecidestocontinue
usingtheclusterwithBCM.
Alicensefilecanonlybeusedonthemachineforwhichithasbeengeneratedandcannotbechanged
onceithasbeenissued.Thismeansthattochangelicensingconditions,anewlicensefilemustbeissued.
The license file is sometimes referred to as the cluster certificate, or head node certificate, because it is
theX509v3certificateoftheheadnode,andisusedthroughoutclusteroperations. Itscomponentsare
locatedunder/cm/local/apps/cmd/etc/.Section2.3oftheAdministratorManualhasmoreinformation
oncertificate-basedauthentication.
4.1 Displaying License Attributes
Beforestartingtheconfigurationofacluster,itisimportanttoverifythattheattributesincludedinthe
licensefilehavebeenassignedthecorrectvalues. Thelicensefileisinstalledinthefollowinglocation:
/cm/local/apps/cmd/etc/cluster.pem
andtheassociatedprivatekeyfileisin:
/cm/local/apps/cmd/etc/cluster.key
4.1.1 DisplayingLicenseAttributesWithinBaseView
BaseViewistypicallyaccessedusinga“home”URLintheformof:
https://<headnodeaddress>:8081/base-view/
To verify that the attributes ofthe license have been assigned the correct values, the license details
canbedisplayedwiththenavigationpathCluster>License Information(figure4.1).

4.2VerifyingALicense—Theverify-licenseUtility 55
Figure4.1: Licenseinformation
4.1.2 DisplayingLicenseAttributesWithincmsh
Alternativelythelicenseinfocommandwithinthemainmodeofcmshmaybeused:
Example
| [root@basecm11 | ~]# cmsh         |     |     |
| -------------- | ---------------- | --- | --- |
| [basecm11]%    | main licenseinfo |     |     |
License Information
------------------------------------ ------------------------------------------------------
Licensee /C=US/ST=California/L=San Jose/O=NVIDIA Corporation...
| Serial       | number       | 2913820                             |                  |
| ------------ | ------------ | ----------------------------------- | ---------------- |
| Start time   |              | Sat Feb                             | 8 16:00:00 2025  |
| End time     |              | Sun May                             | 25 16:59:00 2025 |
| Version      |              | 10 and                              | above            |
| Edition      |              | NVIDIA                              | Mission Control  |
| Type         |              | Free                                |                  |
| Licensed     | nodes        | 56 / 8192                           |                  |
| Licensed     | accelerators | 144 / 8192                          |                  |
| Accelerators | details      | 36 * 4                              | gpu              |
| Allow edge   | sites        | Yes                                 |                  |
| MAC address  | / Cloud ID   | C2:5F:B9:48:A2:3C|7C:C2:A8:6B:9B:EA |                  |
[basecm11]%
Thelicenseshownintheprecedingexampleallows8192nodesand8192GPUstobeused.
The license is tied to a specific MAC address, or to 2 specific MAC addresses in the case of high-
availability, sothatitcannotsimplybeusedelsewhere. Forconvenience, theUsed tokensfieldinthe
outputoflicenseinfoshowsthecurrentnumberofnodesused.
| 4.2 Verifying | A License—The | verify-license | Utility |
| ------------- | ------------- | -------------- | ------- |

56 LicensingNVIDIABaseCommandManager
4.2.1 Theverify-licenseUtilityCanBeUsedWhenlicenseinfoCannotBeUsed
Unlike the licenseinfo command in cmsh (section 4.1), the cluster administrator can run the
verify-licenseutilitytochecklicenseseveniftheclustermanagementdaemonisnotrunning.
Whenaninvalidlicenseisused,theclustermanagementdaemoncannotstart. Thelicenseproblem
isloggedintheclustermanagementdaemonlogfile:
Example
| [root@basecm11 | ~]#               | service cmd               | start   |                     |
| -------------- | ----------------- | ------------------------- | ------- | ------------------- |
| Waiting        | for CMDaemon      | to start...               |         |                     |
| CMDaemon       | failed to         | start please              | see log | file.               |
| [root@basecm11 | ~]#               | tail -1 /var/log/cmdaemon |         |                     |
| Dec 30         | 15:57:02 basecm11 | CMDaemon:                 | Fatal:  | License has expired |
butfurtherinformationcannotbeobtainedusingBaseVieworcmsh, becausetheseclientsthemselves
obtaintheirinformationfromtheclustermanagementdaemon.
Insuchacase,theverify-licenseutilityallowsthetroubleshootingoflicenseissues.
4.2.2 UsingTheverify-licenseUtilityToTroubleshootLicenseIssues
Therearefourwaysinwhichtheverify-licenseutilitycanbeused:
| 1. Usingverify-licensewithnooptions: |     |     |     | simplydisplaysausagetext: |
| ------------------------------------ | --- | --- | --- | ------------------------- |
Example
| [root@basecm11 | ~]# | verify-license |     |     |
| -------------- | --- | -------------- | --- | --- |
Usage: verify-license <path to certificate> <path to keyfile> <verify|info|monthsleft[=12]>
verify-license <verify|info|monthsleft[=12]> (uses /cm/local/apps/cmd/etc/cluster.pem,key)
| 2. Usingverify-licensewiththeinfooption: |     |     |     | printslicensedetails: |
| ---------------------------------------- | --- | --- | --- | --------------------- |
Example
| [root@basecm11 | ~]#          | verify-license | info              |         |
| -------------- | ------------ | -------------- | ----------------- | ------- |
| =========      | Certificate  | Information    | ========          |         |
| Version:       |              |                | 10                |         |
| Edition:       |              |                | NVIDIA Mission    | Control |
| OEM:           |              |                | NVIDIA            |         |
| Common         | name:        |                | basecm11          |         |
| Organization:  |              |                | My organization   |         |
| Organizational | unit:        |                | None              |         |
| Locality:      |              |                | None              |         |
| State:         |              |                | None              |         |
| Country:       |              |                | US                |         |
| Serial:        |              |                | 3174979           |         |
| Starting       | date:        |                | 09/Feb/2025       |         |
| Expiration     | date:        |                | 25/Sep/2025       |         |
| MAC address    | / Cloud      | ID:            | FA:16:3E:73:6E:5E |         |
| Licensed       | tokens:      |                | 8192              |         |
| Accounting     | & Reporting: |                | Yes               |         |
| Allow edge     | sites:       |                | Yes               |         |
| License        | type:        |                | Free              |         |
==========================================

4.2VerifyingALicense—Theverify-licenseUtility 57
3. Usingverify-licensewiththeverifyoption: checksthevalidityofthelicense:
• Ifthelicenseisvalid,thennooutputisproducedandtheutilityexitswithexitcode0.
• Ifthelicenseisinvalid,thenoutputisproducedindicatingwhatiswrong. Messagessuchasthese
arethendisplayed:
|     | – Ifthelicenseisold: |     |     |
| --- | -------------------- | --- | --- |
Example
|     | [root@basecm11                              | ~]# verify-license | verify |
| --- | ------------------------------------------- | ------------------ | ------ |
|     | License has                                 | expired            |        |
|     | License verification                        | failed.            |        |
|     | – IfthecertificateisnotfromBrightComputing: |                    |        |
Example
|     | [root@basecm11 | ~]# verify-license | verify |
| --- | -------------- | ------------------ | ------ |
Invalid license: This certificate was not signed by a correct signing authority
|     | License verification | failed. |     |
| --- | -------------------- | ------- | --- |
4. Usingverify-licensewiththemonthsleft[=<value>]option:
• Ifanumbervalueissetformonthsleft,then
– ifthelicenseisduetoexpireinmorethanthatnumberofmonths,thentheverify-license
commandreturnsnothing.
– if the license is due to expire in less than that number of months, then the verify-license
commandreturnsthedateofexpiry
• Ifanumbervalueisnotsetformonthsleft,thenthevalueissetto12bydefault. Inotherwords,
thedefaultvaluemeansthatifthelicenseisduetoexpireinlessthan12months,thenthedateof
expiryofthelicenseisdisplayed.
Alicense,withjustover3monthsvalidityleft,isexaminedinthefollowingexample:
Example
| [root@basecm11 | etc]#       | date           |              |
| -------------- | ----------- | -------------- | ------------ |
| Tue Jun        | 24 12:49:41 | PM CEST 2025   |              |
| [root@basecm11 | etc]#       | verify-license | monthsleft=3 |
| [root@basecm11 | etc]#       | verify-license | monthsleft=4 |
Cluster Manager license expiration date: 25/Sep/2025, time remaining: 13w 1d
| [root@basecm11 | etc]# | verify-license | monthsleft |
| -------------- | ----- | -------------- | ---------- |
Cluster Manager license expiration date: 25/Sep/2025, time remaining: 13w 1d
4.2.3 UsingTheversioninfoCommandToVerifyTheBCMSoftwareVersion
The license version should not be confused with the BCM software version. The license version is a
licenseformatversionthatrarelychangesbetweenclustermanagerversionreleases. Thusaclustercan
havealicenseversion10.0,whichwasthelicenseformatintroducedduringBCM10.0,andBCMcanbe
atsoftwareversion11.0.
Thesoftwareversionofaclustercanbeviewedusingtheversioninfocommand,whichcanberun
fromthemainmodeofcmshasfollows:
Example

| 58                |             |                | LicensingNVIDIABaseCommandManager |     |
| ----------------- | ----------- | -------------- | --------------------------------- | --- |
| [root@basecm11    | ~]# cmsh    |                |                                   |     |
| [basecm11]% main  |             |                |                                   |     |
| [basecm11->main]% | licenseinfo | | grep Version |                                   |     |
| Version           |             | 10 and above   |                                   |     |
| [basecm11->main]% | versioninfo |                |                                   |     |
versioninfo
Version Information
------------------------ ----------------------------------------------------
| Cluster Manager  | 11.0            |     |     |     |
| ---------------- | --------------- | --- | --- | --- |
| CMDaemon         | 3.1             |     |     |     |
| CMDaemon Build   | Index 163199    |     |     |     |
| CMDaemon Build   | Hash 70ba1c343e |     |     |     |
| Database Version | 36375           |     |     |     |
Intheprecedingexample,theversionoftheclustermanageris11.0,whilethelicenseisforBCM10
andabove.
| 4.3 Requesting | And | Installing A License | Using A Product | Key |
| -------------- | --- | -------------------- | --------------- | --- |
Thelicensefileisintroducedatthestartofthischapter(Chapter4).Asstatedthere,mostadministrators
thathaveinstalledanewcluster,andwhoneedtoinstallalicenseontheclusterinordertomaketheir
BCMfullyfunctional,onlyneedtodothefollowing:
• Havetheirproductkeyathand
• Runtheinstall-licensescriptontheheadnode
The details of this section are therefore usually only of interest if a more explicit understanding of
theprocessisrequiredforsomereason.
4.3.1 IsALicenseNeeded?—VerifyingLicenseAttributes
Beforeinstallingalicense,thelicenseattributesshouldbeverified(section4.2)tocheckifinstallationis
actuallyneeded. Iftheattributesofthelicensearecorrect,theremainingpartsofthissection(4.3)may
safelybeskipped. Otherwisetheproductkey(page58)isusedtoinstallalicense.
Incorrect license attributes will cause cluster configuration to fail or may lead to a misconfigured
cluster. A misconfigured cluster may, for example, not have the ability to handle the full number of
GPUsornodes. Inparticular, thelicensedateshouldbecheckedtomakesurethatthelicensehasnot
expired. If the license is invalid, and it should be valid according to the administrator, then the BCM
resellerthatprovidedthesoftwareshouldbecontactedwithdetailstocorrectmatters.
IfBCMisalreadyrunningwitharegularlicense,andifthelicenseisduetoexpire,thenreminders
aresenttotheadministratore-mailaddress(page94oftheAdministratorManual).
4.3.2 TheProductKey
AproductkeyisissuedbyanaccountmanagerforBCM.Theproductkeyallowsalicensetobeobtained
torunBCM.
An account manager is the person from BCM who checks that the product key user has the right
entitlements to use the key before it is issued. The customer is informed who the account manager
is when BCM is purchased. Purchasing and licensing period queries are normally dealt with by the
accountmanager,whileothertechnicalqueriesthatcannotbeansweredbyexistingdocumentationcan
bedealtwithbyBCMtechnicalsupport(section14.2oftheAdministratorManual).
Thefollowingproductkeytypesarepossible:
• Evaluationproductkey: Anevaluationlicenseisatemporarylicensethatcanbeinstalledviaan
evaluationproductkey. Theevaluationproductkeyisvalidfor amaximumof3monthsfrom a
specifieddate,unlesstheaccountmanagerapprovesafurtherextension.

4.3RequestingAndInstallingALicenseUsingAProductKey 59
IfaclusterhasBCMinstalledonit,thenatemporarylicensetoruntheclustercanbeinstalledwith
an evaluation product key. Such a key allows to the cluster to run with defined attributes, such
asacertainnumberofnodesandfeaturesenabled,dependingonwhatwasagreeduponwiththe
accountmanager. Thetemporarylicenseisvaliduntiltheproductkeyexpires,unlesstheaccount
managerhasapprovedfurtherextensionoftheproductkey,andthelicensehasbeenre-installed.
EvaluationISOdownloadsofBCMfromtheBCMwebsitecomewithabuilt-inlicensethatover-
ridesanyproductkeyattributes. Thelicenseistemporary. AnevaluationISOproductkeyallows
the user to download the ISO with a temporary built-in license. The temporary built-in license
thenallows2-nodeclusterstobetriedout. Suchaclustercancomprise1headnodeand1com-
putenode,oritcancomprise2headnodes. A2-nodeclusterisaverylimitedcluster,andsupport
forthisisgivenaccordingly.
• Subscriptionproductkey:Asubscriptionlicenseisalicensethatcanbeinstalledwithasubscrip-
tion product key. The subscription product key has some attributes that decide the subscription
lengthandothersettingsforthelicense. Thelengthcanbesettoanyvalue.
IfaclusterhasBCMinstalledonit,thenasubscriptionlicensetoruntheclustercanbeinstalled
withasubscriptionproductkey. Suchakeyallowstheclustertorunwithdefinedattributes,such
asacertainnumberofnodesandfeaturesenabled,dependingonwhatwasagreeduponwiththe
accountmanager. Thesubscriptionlicenseisvaliduntilthesubscriptionproductkeyexpires.
• Hardwarelifetimeproductkey: Thisisalegacyproductkeythatissupportedforthehardware
lifetime. Itisnolongerissued.
Theproductkeylookslike: thefollowingpatternofdigits:
000354-515786-112224-207441-186713
If the product key has been used on the cluster already: then it can be retrieved from the CSR file
(page60)withthecommand:
cm-get-product-key
The product key allows: the administrator to obtain and activate a license, which allows the cluster
managertofunction.
Thefollowingterminologyisused: whentalkingaboutproductkeys,locking,licenses,installation,
andregistration:
• activatingalicense: AproductkeyisobtainedfromanyBCM(re)seller. Itisusedtoobtainand
activatealicensefile. ActivationmeansthatNVIDIArecordsthattheproductkeyhasbeenused
toobtainalicensefile. Thelicenseobtainedbyproductkeyactivationpermitstheclustertowork
with particular settings. For example, the subscription period, and the number of nodes. The
subscriptionstartandenddatecannotbealteredforthelicensefileassociatedwiththekey,soan
administratornormallyactivatesthelicensefileassoonaspossibleafterthestartingdateinorder
tonotwastethesubscriptionperiod.
• lockingaproductkey: Theadministratorisnormallyallowedtouseaproductkeytoactivatea
licenseonlyonce.Thisisbecauseaproductkeyislockedonactivationofthelicense.Alockedstate
meansthatproductkeycannotactivateanewlicense—itis“usedup”.
Anactivatedlicenseonlyworksonthehardwarethattheproductkeywasusedwith. Thiscould
obviouslybeaproblemiftheadministratorwantstomoveBCMtonewhardware. Insuchacase,

60 LicensingNVIDIABaseCommandManager
the product key must be unlocked. Unlocking is possible for a subscription license via https:
//customer.brightcomputing.com/unlock.
Unlockinganevaluationlicense,orahardwarelifetimelicense,ispossiblebysendingarequestto
theaccountmanageratNVIDIAtounlocktheproductkey.
Oncetheproductkeyisunlocked,thenitcanbeusedonceagaintoactivateanewlicense.
• license installation: License installation occurs on the cluster after the license is activated and is-
sued. Theinstallationisdoneautomaticallyifpossible. Sometimesinstallationneedstobedone
manually, as explained in the section on the request-license script (page 60). The license can
only work on the hardware it was specified for. After installation is complete, the cluster runs
withtheactivatedlicense.
4.3.3 RequestingALicenseWithTherequest-licenseScript
Ifthelicensehasexpired,orifthelicenseattributesareotherwisenotcorrect,anewlicensefilemustbe
requested.
Therequestforanewlicensefileismadeusingaproductkey(page58)withtherequest-license
command.
The request-license command is used to request and activate a license, and works most conve-
niently with a cluster that is able to access the internet. The request can also be made regardless of
clusterconnectivitytooutsidenetworks.
Therearethreeoptionstousetheproductkeytogetthelicense:
1. DirectWWWaccess: IftheclusterhasaccesstotheWWWport,thenasuccessfulcompletionof
therequest-licensecommandobtainsandactivatesthelicense. Italsolockstheproductkey.
• Proxy WWW access: If the cluster uses a web-proxy, then the environment variable
http_proxymustbesetbeforetherequest-licensecommandisrun. Fromabashprompt
thisissetwith:
export http_proxy=<proxy>
where<proxy>isthehostnameorIPaddressoftheproxy. Anequivalentalternativeisthat
theScriptEnvironmentdirective(page905oftheAdministratorManual),whichisaCMDae-
mondirective,canbesetandactivated(page885oftheAdministratorManual).
2. Off-cluster WWW access: If the cluster does not have access to the WWW port,
but the administrator does have off-cluster web-browser access, then the point at
which the request-license command prompts “Submit certificate request to
http://licensing.brightcomputing.com/licensing/index.cgi ?” should be answered
negatively. CSR (Certificate Sign Request) data generated is then conveniently displayed
on the screen as well as saved in the file /cm/local/apps/cmd/etc/cluster.csr.new. The
cluster.csr.newfilemaybetakenoff-clusterandprocessedwithanoff-clusterbrowser.
The CSR file should not be confused with the private key file, cluster.key.new, created shortly
beforehandbytherequest-licensecommand. Inordertomaintainclustersecurity,theprivate
keyfilemust,inprinciple,neverleavethecluster.
At the off-cluster web-browser, the administrator may enter the cluster.csr.new content in a
webformat:
http://licensing.brightcomputing.com/licensing
A signed license text is returned. At NVIDIA the license is noted as having been activated, and
theproductkeyislocked.
The signed license text received by the administrator is in the form of a plain text certificate. As
thewebformresponseexplains,itcanbesaveddirectlyfrommostbrowsers. Cuttingandpasting

4.3RequestingAndInstallingALicenseUsingAProductKey 61
thetextintoaneditorandthensavingitispossibletoo,sincetheresponseisplaintext. Thesaved
signed license file, <signedlicense>, should then be put on the head node. If there is a copy of
thefileontheoff-clustermachine,theadministratorshouldconsiderwipingthatcopyinorderto
reduceinformationleakage.
Thecommand:
| install-license |     |     | <signedlicense> |     |     |
| --------------- | --- | --- | --------------- | --- | --- |
installs the signed license on the head node, and is described further on page 61. Installation
meanstheclusternowrunswiththeactivatedcertificate.
3. Faxorphysicaldelivery: Ifnointernetaccessisavailableatalltotheadministrator,theCSRdata
maybefaxedorsentasaphysicaldelivery(postalmailprintout,USBflashdrive/floppydisk)to
anyBCMreseller. Acertificatewillbefaxedorsentbackinresponse,thelicensewillbenotedby
NVIDIAashavingbeenactivated,andtheassociatedproductkeywillbenotedasbeinglocked.
Thecertificatecanthenbehandledfurtherasdescribedinoption2.
Example
| [root@basecm11 |                                           | ~]# request-license |     |     |     |
| -------------- | ----------------------------------------- | ------------------- | --- | --- | --- |
| Product        | Key (XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX): |                     |     |     |     |
000354-515786-112224-207440-186713
| Country        | Name (2  | letter   | code):     | US                                     |             |
| -------------- | -------- | -------- | ---------- | -------------------------------------- | ----------- |
| State or       | Province | Name     | (full      | name):                                 | California  |
| Locality       | Name     | (e.g.    | city):     | San Jose                               |             |
| Organization   | Name     | (e.g.    | company):  | ACME                                   | Inc.        |
| Organizational |          | Unit     | Name (e.g. | department):                           | Development |
| Cluster        | Name:    | basecm11 |            |                                        |             |
| Private        | key data | saved    | to         | /cm/local/apps/cmd/etc/cluster.key.new |             |
MAC Address of primary head node (basecm11) for eth0 [00:0C:29:87:B8:B3]:
Will this cluster use a high-availability setup with 2 head nodes? [y/N] n
Certificate request data saved to /cm/local/apps/cmd/etc/cluster.csr.new
Submit certificate request to http://licensing.brightcomputing.com/licensing/ ? [Y/n] y
| Contacting | http://licensing.brightcomputing.com/licensing/... |     |     |     |     |
| ---------- | -------------------------------------------------- | --- | --- | --- | --- |
License granted.
| License | data was | saved   | to  | /cm/local/apps/cmd/etc/cluster.pem.new |     |
| ------- | -------- | ------- | --- | -------------------------------------- | --- |
| Install | license  | ? [Y/n] | n   |                                        |     |
Use "install-license /cm/local/apps/cmd/etc/cluster.pem.new" to install the license.
4.3.4 InstallingALicenseWithTheinstall-licenseScript
Referringtotheprecedingrequest-licenseexampleoutput:
TheadministratorispromptedtoentertheMACaddressforeth0.
AfterthecertificaterequestissenttoNVIDIAandapproved,thelicenseisgranted.
Iftheprompt“Install license?”isansweredwitha“Y”(thedefault),theinstall-licensescript
isrunautomaticallybytherequest-licensescript.
Ifthepromptisansweredwithan“n”thentheinstall-licensescriptmustberunexplicitlylater
on by the administrator in order to complete installation of the license. This is typically needed for
clustersthathavenodirectorproxywebaccess(page60).
Thedecisionthatismadeatthepromptalsohasconsequencesfortherebootrequirementsofnodes.
Theseconsequencesareexplainedindetailinsection4.3.7.

| 62  |     |     |     |     | LicensingNVIDIABaseCommandManager |
| --- | --- | --- | --- | --- | --------------------------------- |
The install-license script takes the temporary location of the new license file generated by
request-license as its argument, and installs related files on the head node. Running it completes
thelicenseinstallationontheheadnode.
Example
Assumingthenewcertificateissavedascluster.pem.new:
[root@basecm11 ~]# install-license /cm/local/apps/cmd/etc/cluster.pem.new
| =========      | Certificate | Information       | ======== |     |     |
| -------------- | ----------- | ----------------- | -------- | --- | --- |
| Version:       |             | 11.0              |          |     |     |
| Edition:       |             | Advanced          |          |     |     |
| Common         | name:       | basecm11          |          |     |     |
| Organization:  |             | ACME Inc.         |          |     |     |
| Organizational | unit:       | Development       |          |     |     |
| Locality:      |             | San Jose          |          |     |     |
| State:         |             | California        |          |     |     |
| Country:       |             | US                |          |     |     |
| Serial:        |             | 9463              |          |     |     |
| Starting       | date:       | 23 Dec 2012       |          |     |     |
| Expiration     | date:       | 31 Dec 2013       |          |     |     |
| MAC address:   |             | 08:0A:27:BA:B9:43 |          |     |     |
| Pre-paid       | nodes:      | 10                |          |     |     |
==========================================
| Is the     | license information | correct        | ? [Y/n] | y            |     |
| ---------- | ------------------- | -------------- | ------- | ------------ | --- |
| Installed  | new license         |                |         |              |     |
| Restarting | Cluster             | Manager Daemon | to use  | new license: | OK  |
4.3.5 Re-InstallingALicenseAfterReplacingTheHardware
Ifanewheadnodeistoberunonnewhardwarethen:
• Iftheoldheadnodeisnotabletorunnormally,thenthenewheadnodecanhavetheheadnode
dataplacedonitfromtheoldheadnodedatabackup.
• Iftheoldheadnodeisstillrunningnormally,thenthenewheadnodecanhavedataplacedonit
byacloningactionrunfromtheoldheadnode(section15.4.8oftheAdministratorManual).
Iftheheadnodehardwarehaschanged,then:
• a user with a subscription license can unlock the product key directly via https://customer.
brightcomputing.com/unlock.
• a user with a hardware license almost always has the license under the condition that it expires
whenthehardwareexpires. Therefore,auserwithahardwarelicensewhoisreplacingthehard-
ware is almost always restricted from a license reinstallation. Users without this restriction may
requesttheaccountmanageratNVIDIAtounlocktheproductkey.
Using the product key with the request-license script then allows a new license to be requested,
whichcanthenbeinstalledbyrunningtheinstall-licensescript. Theinstall-licensescriptmay
notactuallybeneeded,butitdoesnoharmtorunitjustincaseafterwards.

4.3RequestingAndInstallingALicenseUsingAProductKey 63
4.3.6 Re-InstallingALicenseAfterWipingOrReplacingTheHardDrive
Iftheheadnodehardwarehasotherwisenotchanged:
• Thefulldriveimagecanbecopiedontoablankdriveandthesystemwillworkasbefore.
• Alternatively,ifanewinstallationfromscratchisdone
– then after the installation is done, a license can be requested and installed once more using
the same product key, using the request-license command. Because the product key is
normallylockedwhenthepreviouslicenserequestwasdone,arequesttounlocktheproduct
keyusuallyneedstobesenttotheaccountmanageratNVIDIAbeforethelicenserequestcan
beexecuted.
– Iftheadministratorwantstoavoidusingtherequest-licensecommandandhavingtotype
in a product key, then some certificate key pairs must be placed on the new drive from the
| olddrive,inthesamelocations. |     | Theprocedurethatcanbefollowedis: |     |     |
| ---------------------------- | --- | -------------------------------- | --- | --- |
1. inthedirectory/cm/local/apps/cmd/etc/,thefollowingkeypairiscopiedover:
cluster.key
*
cluster.pem
*
Copyingtheseacrossmeansthatrequest-licensedoesnotneedtobeused.
2. Theadmin.{pem|key}keypairfilescanthenbeplacedinthedirectory/root/.cm/cmsh/.
Twooptionsare:
thefollowingkeypaircanbecopiedover:
*
· admin.key
· admin.pem
or
afreshadmin.{pem|key}keypaircanbegeneratedinsteadviaacmd -boption:
*
Example
| [root@basecm11 | ~]#         | service cmd stop           |                     |              |
| -------------- | ----------- | -------------------------- | ------------------- | ------------ |
| [root@basecm11 | ~]#         | cmd -b                     |                     |              |
| [root@basecm11 | ~]#         | [...]                      |                     |              |
| Tue Jan        | 21 11:47:54 | [ CMD ] Info:              | Created certificate | in admin.pem |
| Tue Jan        | 21 11:47:54 | [ CMD ] Info:              | Created certificate | in admin.key |
| [root@basecm11 | ~]#         | [...]                      |                     |              |
| [root@basecm11 | ~]#         | chmod 600 admin.*          |                     |              |
| [root@basecm11 | ~]#         | mv admin.* /root/.cm/cmsh/ |                     |              |
| [root@basecm11 | ~]#         | service cmd start          |                     |              |
Itisrecommendedforsecurityreasonsthattheadministratorensurethatunnecessaryextra
certificatekeypaircopiesnolongerexistafterinstallationonthenewdrive.
4.3.7 RebootingNodesAfterAnInstall
Thefirsttimeaproductkeyisused: Afterusingaproductkeywiththecommandrequest-license
duringaclusterinstallationforthefirsttime,andthenrunninginstall-license,arebootisrequiredof
allnodesinorderforthemtopickupandinstalltheirnewcertificates(section5.4.1oftheAdministrator
Manual). The install-license script has at this point already renewed the administrator certificates
ontheheadnodethatareforusewithcmshandBaseView. Theparallelexecutioncommandpdsh -g
computenode rebootsuggestedtowardstheendoftheinstall-licensescriptoutputiswhatcanbe
usedtorebootallothernodes. Sincesuchacommandisbestdonebyanadministratormanually,pdsh
-g computenode rebootisnotscripted.

64 LicensingNVIDIABaseCommandManager
The subsequent times that the same product key, or another product key, is used: If a license has
become invalid, a new license may be requested. On running the command request-license for the
cluster, withthesameproductkey, oranotherproductkey, theadministratorispromptedonwhether
tore-usetheexistingkeysandsettingsfromtheexistinglicense:
Example
[root@basecm11 ~]# request-license
Product Key (XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX): 061792-900914-800220-270420-077926
Existing license was found:
Country: US
State: None
Locality: None
Organization: None
Organizational Unit: None
Cluster Name: basecm11
You can choose whether to re-use private key and settings from existing license.
If you answer NO, existing certificates will be invalidated and nodes will have to be rebooted.
...
• Iftheexistingkeysarekept,apdsh -g computenode rebootisnotrequired.Thisisbecausethese
keysareX509v3certificatesissuedfromtheheadnode. Forthese:
– Anynodecertificates(section5.4.1oftheAdministratorManual)thatweregeneratedusingthe
oldcertificatearethereforestillvalidandsoregeneratingthemfornodesviaarebootisnot
required,allowinguserstocontinueworkinguninterrupted. Onrebootnewnodecertificates
aregeneratedandusedifneeded.
– User certificates (section 6.4 of the Administrator Manual) become invalid during certificate
regeneration when CMDaemon restarts itself. It is therefore advised to install a permanent
license as soon as possible, or alternatively, to not bother creating user certificates until a
permanentlicensehasbeensetupforthecluster.
• Iftheexistingkeysarenotre-used,thennodecommunicationceasesuntilthenodesarerebooted.
IftherearejobsrunningonBCMnodes,theycannotthencomplete.
Afterthelicenseisinstalled, verifyingthelicenseattributevaluesisagoodidea. Thiscanbedone
usingthelicenseinfocommandincmsh, orbyselectingtheLicense infomenuoptionfromwithin
thePartition basewindowinBaseView’sClusterresource(section4.1).
TheLicenseLogFile
Licenseinstallationandchangesareloggedin
/var/spool/cmd/license.log
tohelpdebugissues.
4.3.8 GettingHelpWithLicensingIssues
Thecustomerportalathttps://enterprise-support.nvidia.com/s/create-caseallowssupporttick-
etstobesubmittedforlicensingissues. Furtherdetailsonthisareinsection14.2.1oftheAdministrator
Manual.

5
Linux Distributions That Use
Registration
This chapter describes setting up registered access for the NVIDIA Base Command Manager with the
RedHatandSUSEdistributions.
TheheadnodeandregularnodeimagescanbesetupwithregisteredaccesstotheenterpriseLinux
distributionsofRedHatandSUSEsothatupdatesfromtheirrepositoriescantakeplaceonthecluster
correctly. Thisallowsthedistributionstocontinuetoprovidesupportandsecurityupdates. Registered
access can also be set up in order to create an up-to-date custom software image (section 9.6 of the
AdministratorManual)ifusingRedHatorSUSEasthebasedistribution.
Registered access can be avoided for the head node and regular node images by moving the reg-
istration requirement to outside the cluster. This can be done by configuring registration to run from
a local mirror to the enterprise Linux distributions. The head node and regular node images are then
configuredtoaccessthelocalmirrorrepository. Thisconfigurationhasthebenefitofreducingthetraf-
fic between the local network and the internet. However it should be noted that the traffic from node
updatesscalesaccordingtothenumberofregularnodeimages,ratherthanaccordingtothenumberof
nodesinthecluster. Inmostcases,therefore,theaddedcomplicationofrunningaseparaterepository
mirror,isunlikelytobeworthimplementing.
5.1 Registering A Red Hat Enterprise Linux Based Cluster
ToregisteraRedHatEnterpriseLinux(RHEL)system,RedHatsubscriptionsareneededasdescribed
athttps://www.redhat.com/. RegistrationwiththeRedHatNetworkisneededtoinstallnewRHEL
packagesorreceiveRHELpackageupdates,aswellascarryoutsomeothertasks.
5.1.1 RegisteringAHeadNodeWithRHEL
An RHEL head node can be registered from the command line with the subscription-manager com-
mand. ThisusestheRedHatsubscriptionserviceusernameandpasswordasshown:
[root@basecm11 ~]# subscription-manager register --username <username> --password <password> \
--auto-attach
The--auto-attachoptionallowsasystemtoupdateitssubscriptionautomatically,sothatthesys-
temendsupwithavalidsubscriptionstate.
Iftheheadnodehasnodirectconnectiontotheinternet,thenanHTTPproxycanbeconfiguredas
acommandlineoption. Thesubscription-managermanpagesgivedetailsonconfiguringtheproxy
fromthecommandline.
Afterregistration, theyumsubscription-managerpluginisenabled. Thismeansthatyumcannow
beusedtoinstallandupdatefromtheRedHatNetworkrepositories.
Thelistofenabledanddisabledrepositoriescanbeseenwith:

| 66             |     |              |     |     | LinuxDistributionsThatUseRegistration |     |
| -------------- | --- | ------------ | --- | --- | ------------------------------------- | --- |
| [root@basecm11 | ~]# | yum repolist | all |     |                                       |     |
5.1.2 RegisteringASoftwareImageWithRHEL
subscription-manager
The command can be used to register an RHEL software image. If the head
node, on which the software image resides, has no direct connection to the internet, then an HTTP
proxycanbeconfiguredasacommandlineoption. Thesubscription-managermanpagesgivedetails
onconfiguringtheproxyfromthecommandline.
Thedefaultsoftwareimage,default-image,canberegisteredbymountingsomepartsofthefilesys-
temimage, andthencarryingouttheregistrationwithintheimagebyusingtheRedHatsubscription
service username and password. This can be carried out on the head node, with the help of the BCM
cm-chroot-sw-imgtool(page530oftheAdministratorManual)asfollows:
[root@basecm11 ~]# cm-chroot-sw-img /cm/images/default-image subscription-manager register --username \
| <username> --password |     | <password> | --auto-attach |     |     |     |
| --------------------- | --- | ---------- | ------------- | --- | --- | --- |
Afterregistration,theyumsubscription-managerpluginisenabledwithinthesoftwareimage. This
means that yum can now be used to install and update the software image from the Red Hat Network
repositories.
Thelistofenabledrepositoriesintheimagecanbeseenwith:
[root@basecm11 ~]# cm-chroot-sw-img /cm/images/default-image yum repolist
| repo id   |     |     | repo      | name     |                    |         |
| --------- | --- | --- | --------- | -------- | ------------------ | ------- |
| AppStream |     |     | AppStream | Packages | Red Hat Enterprise | Linux 9 |
| BaseOS    |     |     | BaseOS    | Packages | Red Hat Enterprise | Linux 9 |
...
| 5.2 Registering |     | A SUSE | Linux | Enterprise | Server Based | Cluster |
| --------------- | --- | ------ | ----- | ---------- | ------------ | ------- |
To register a SUSE Linux Enterprise Server system, SUSE Linux Enterprise Server subscriptions are
neededasdescribedathttp://www.suse.com/. RegistrationwithSUSEhelpswithinstallingnewSLES
packagesorreceivingSLESpackageupdates,aswellastocarryoutsomeothertasks.
5.2.1 RegisteringAHeadNodeWithSUSE
ThesuseconnectcommandcanbeusedtoregisteraSUSE15headnode. Iftheheadnodehasnodirect
connection to the internet, then the HTTP_PROXY and HTTPS_PROXY environment variables can be set,
to access the internet via a proxy. Running the registration command with the help option, “--help”,
providesfurtherinformationaboutthecommandanditsoptions.
Theheadnodecanberegisteredasfollows:
[root@basecm11(cid:3)]# suseconnect -e <e-mail address> -r <registration code> -u https://scc.suse.com
The e-mail address used is the address that was used to register the subscription with SUSE. When
logged in on the SUSE site, the registration code can be found at the products overview page after
| selecting“SUSE | Linux | Enterprise | Server”. |     |     |     |
| -------------- | ----- | ---------- | -------- | --- | --- | --- |
Afterregistering,theSLESrepositoriesareautomaticallyaddedtotherepositorylistandenabled.
Thedefinedrepositoriescanbelistedwith:
| [root@basecm11 | ~]# | zypper lr |     |     |     |     |
| -------------- | --- | --------- | --- | --- | --- | --- |
andtheheadnodecanbeupdatedwith:
| [root@basecm11 | ~]# | zypper refresh |     |     |     |     |
| -------------- | --- | -------------- | --- | --- | --- | --- |
| [root@basecm11 | ~]# | zypper update  |     |     |     |     |

5.2RegisteringASUSELinuxEnterpriseServerBasedCluster 67
5.2.2 RegisteringASoftwareImageWithSUSE
The SUSEConnect command can be used to register a SUSE 15 software image. If the head node on
which the software image resides has no direct connection to the internet, then the HTTP_PROXY and
HTTPS_PROXYenvironmentvariablescanbesettoaccesstheinternetviaaproxy. Runningthecommand
withthehelpoption,“--help”,providesfurtherinformationaboutthecommandanditsoptions.
Thedefaultsoftwareimagedefault-imagecanberegisteredbyrunningthefollowingonthehead
node:
| [root@basecm11(cid:3)]# | cm-chroot-sw-img |                      | /cm/images/default-image |     | \   |
| ----------------------- | ---------------- | -------------------- | ------------------------ | --- | --- |
| suseconnect             | -e <e-mail       | address>             | -r regcode-sles=         | \   |     |
| <activation             | code> -u         | https://scc.suse.com |                          |     |     |
The e-mail address is the address used to register the subscription with SUSE. When logged in on
theSUSEsite,theactivationcodeorregistrationcodecanbefoundattheproductsoverviewpageafter
| selecting“SUSE | Linux | Enterprise | Server”. |     |     |
| -------------- | ----- | ---------- | -------- | --- | --- |
When running the registration command, warnings about the /sys or /proc filesystems can be ig-
nored. The command tries to query hardware information via these filesystems, but these are empty
filesystemsinasoftwareimage,andonlyfilluponthenodeitselfaftertheimageisprovisionedtothe
node.
Instead of registering the software image, the SLES repositories can be enabled for the
default-imagesoftwareimagewith:
[root@basecm11 ~]# cp /etc/zypp/repos.d/* /cm/images/default-image/etc/zypp/repos.d/
[root@basecm11 ~]# cp /etc/zypp/credentials.d/* /cm/images/default-image/etc/zypp/credentials.d/
[root@basecm11 ~]# cp /etc/zypp/service.d/* /cm/images/default-image/etc/zypp/service.d/
The copied files should be reviewed. Any unwanted repositories, unwanted service files, and un-
wantedcredentialfiles,mustberemoved.
Therepositorylistofthedefault-imagesoftwareimagecanbeviewedwiththechrootoption,-R,
asfollows:
| [root@basecm11 | ~]# | zypper -R /cm/images/default-image |     | lr  |     |
| -------------- | --- | ---------------------------------- | --- | --- | --- |
andthesoftwareimagecanbeupdatedwith:
| [root@basecm11 | ~]# | export PBL_SKIP_BOOT_TEST=1        |     |         |       |
| -------------- | --- | ---------------------------------- | --- | ------- | ----- |
| [root@basecm11 | ~]# | zypper -R /cm/images/default-image |     | refresh |       |
| [root@basecm11 | ~]# | zypper -R /cm/images/default-image |     | update  |       |
| [root@basecm11 | ~]# | zypper -R /cm/images/default-image |     | clean   | --all |

6
Changing The Network
Parameters Of The Head Node
6.1 Introduction
Afteraclusterphysicallyarrivesatitssite, theadministratoroftenhastochangethenetworksettings
tosuitthesite. Detailsonthisaregiveninsection3.2.1oftheAdministratorManual. However,itrelies
onunderstandingthematerialleadinguptothatsection.
This chapter is therefore a quickstart document—conveniently a mere 3 pages—explaining how to
change basic IPv4 network settings while assuming no prior knowledge of NVIDIA Base Command
Manageranditsnetworkconfigurationinterface.
6.2 Method
Aclusterconsistsofaheadnode,saybasecm11andoneormoreregularnodes. Theheadnodeofthe
clusterisassumedtofacetheinternalnetwork(thenetworkofregularnodes)ononeinterface,sayeth0.
Theexternalnetworkleadingtotheinternetisthenonanotherinterface,sayeth1. Thisisreferredtoas
atype1configurationinthismanual(section3.3.9).
Typically,anadministratorgivestheheadnodeastaticexternalIPaddressbeforeactuallyconnect-
ing it up to the external network. This requires logging into the physical head node with the vendor-
suppliedrootpassword. Theoriginalnetworkparametersoftheheadnodecanthenbeviewedandset.
Forexampleforeth1:
# cmsh -c "device interfaces basecm11; get eth1 dhcp"
yes
Here,yesmeanstheinterfaceacceptsDHCPserver-suppliedvalues.
DisablingDHCPacceptanceallowsastaticIPaddress,forexample192.168.1.176,tobeset:
# cmsh -c "device interfaces basecm11; set eth1 dhcp no"
# cmsh -c "device interfaces basecm11; set eth1 ip 192.168.1.176; commit"
# cmsh -c "device interfaces basecm11; get eth1 ip"
192.168.1.176
Otherexternalnetworkparameterscanbeviewedandsetinasimilarway,asshownintable6.1. A
rebootimplementsthenetworkingchanges.
6.3 Terminology
Areminderaboutthelesswell-knownterminologyinthetable:
• netmaskbitsisthenetmasksize,orprefix-length,inbits.InIPv4’s32-bitaddressing,thiscanbeup
to31bits,soitisanumberbetween1and31. Forexample: networkswith256(28)addresses(i.e.

| 70  |     | ChangingTheNetworkParametersOfTheHeadNode |     |     |     |     |
| --- | --- | ----------------------------------------- | --- | --- | --- | --- |
**Space-separatedmultiplevaluesarealsoacceptedfortheseparameterswhensettingthevalueforaddressorhostname. *Ifaddressissetto0.0.0.0thenthevalueofferedbytheDHCPserverontheexternalnetworkisaccepted Table6.1:
timeservers searchdomains nameservers gateway netmaskbits broadcastaddress baseaddress IP
NetworkParameter
∗
|     |     | ∗   |     |     |     | ExternalNetworkParametersAndHowToChangeThemOnTheHeadNode |
| --- | --- | --- | --- | --- | --- | -------------------------------------------------------- |
| ∗∗  |     |     |     |     | ∗   |                                                          |
∗,
∗∗
∗∗
∗
nameoftimeservers nameofsearchdomains nameserverIPaddresses IPaddress gateway(defaultroute) length) (numberafter“/”,orprefix netmaskinCIDRnotation network broadcastIPaddressof address)ofnetwork baseIPaddress(network oneth1interface IPaddressofheadnode Description
set view set view set view set view set view set view set view set view
Operation
cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh cmsh CommandUsed
| -c -c | -c -c -c -c | -c -c | -c -c | -c -c | -c -c | -c -c |
| ----- | ----------- | ----- | ----- | ----- | ----- | ----- |
"partition; "partition "partition; "partition "partition; "partition "network; "network "network; "network "network; "network "network; "network "device "device
|              |                             |             |              |                   |              | interfaces interfaces |
| ------------ | --------------------------- | ----------- | ------------ | ----------------- | ------------ | --------------------- |
|              |                             | get         | get          | get               | get          |                       |
|              |                             | set         | set          | set               | set          |                       |
| get          | get get                     |             |              |                   |              |                       |
| set          | set set                     |             |              |                   |              |                       |
|              |                             | externalnet | externalnet  | externalnet       | externalnet  |                       |
|              |                             | externalnet | externalnet  | externalnet       | externalnet  |                       |
| base         | base base                   |             |              |                   |              |                       |
| base         | base base                   |             |              |                   |              |                       |
|              |                             |             |              |                   |              | basecm11; basecm11;   |
| timeservers" | searchdomains" nameservers" |             |              |                   |              |                       |
| timeservers  | searchdomains nameservers   |             |              |                   |              |                       |
|              |                             | gateway"    | netmaskbits" | broadcastaddress" | baseaddress" |                       |
|              |                             | gateway     | netmaskbits  | broadcastaddress  | baseaddress  |                       |
|              |                             |             |              |                   |              | set get               |
| address;     | address;                    |             |              |                   |              | eth1 eth1             |
address;
hostname;
|         |         |         | bitsize; |     | address; | ip ip"   |
| ------- | ------- | ------- | -------- | --- | -------- | -------- |
| commit" | commit" |         |          |     |          |          |
|         |         | commit" |          |     |          | address; |
address;
commit"
|     |     |     | commit" |     | commit" |     |
| --- | --- | --- | ------- | --- | ------- | --- |
commit"
commit"

6.3Terminology 71
withhostaddressesspecifiedwiththelast8bits)haveanetmasksizeof24bits. Theyarewritten
inCIDRnotationwithatrailing“/24”,andarecommonlyspokenofas“slash24”networks.
• baseaddress is the IP address of the network the head node is on, rather than the IP address of
theheadnodeitself. Thebaseaddressisspecifiedbytakingnetmaskbitsnumberofbitsfromthe
| IPaddressoftheheadnode. |     | Examples: |     |     |
| ----------------------- | --- | --------- | --- | --- |
– A network with 256 (28) host addresses: This implies the first 24 bits of the head node’s
IP address are the network address, and the remaining 8 bits are zeroed. This is specified
by using “0” as the last value in the dotted-quad notation (i.e. zeroing the last 8 bits). For
|     | example: 192.168.3.0 |      |     |             |
| --- | -------------------- | ---- | --- | ----------- |
|     | –                    | (27) |     | netmaskbits |
A network with 128 host addresses: Here is 25 bits in size, and only the
last7bitsarezeroed. Indotted-quadnotationthisimplies“128”asthelastquadvalue(i.e.
|     | zeroingthelast7bits). | Forexample: | 192.168.3.128. |     |
| --- | --------------------- | ----------- | -------------- | --- |
Whenindoubt,oriftheprecedingterminologyisnotunderstood,thenthevaluestousecanbecalcu-
latedusingtheheadnode’ssipcalcutility. Touseit,theIPaddressinCIDRformatfortheheadnode
mustbeknown.
WhenrunusingaCIDRaddressvalueof192.168.3.130/25,theoutputis(someoutputremovedfor
clarity):
| # sipcalc    | 192.168.3.130/25 |                   |                 |     |
| ------------ | ---------------- | ----------------- | --------------- | --- |
| Host address |                  | - 192.168.3.130   |                 |     |
| Network      | address          | - 192.168.3.128   |                 |     |
| Network      | mask             | - 255.255.255.128 |                 |     |
| Network      | mask (bits)      | - 25              |                 |     |
| Broadcast    | address          | - 192.168.3.255   |                 |     |
| Addresses    | in network       | - 128             |                 |     |
| Network      | range            | - 192.168.3.128   | - 192.168.3.255 |     |
Runningitwiththe-b(binary)optionmayaidcomprehension:
| # sipcalc    | -b 192.168.3.130/25 |                                       |     |     |
| ------------ | ------------------- | ------------------------------------- | --- | --- |
| Host address |                     | - 11000000.10101000.00000011.10000010 |     |     |
| Network      | address             | - 11000000.10101000.00000011.10000000 |     |     |
| Network      | mask                | - 11111111.11111111.11111111.10000000 |     |     |
| Broadcast    | address             | - 11000000.10101000.00000011.11111111 |     |     |
| Network      | range               | - 11000000.10101000.00000011.10000000 |     | -   |
11000000.10101000.00000011.11111111

7
Third Party Software
In this chapter, several third party software packages included in the BCM repository are described
briefly. Forallpackages,referencestothecompletedocumentationareprovided.
Thepackagesdashboardathttps://service.bcm.nvidia.com/packages-dashboard/liststheavail-
ablesupportedpackageversionsperBCMversion,architecture,anddistribution.
7.1 Modules Environment
RHELandderivatives,andSLESBCMpackagename: env-modules
Ubuntupackagename: cm-modules
The modules environment package is installed by default on the head node. The home page for the
software is at http://modules.sourceforge.net/). The software allows a user of a cluster to modify
the shell environment for a particular application, or even for a particular version of an application.
Typically,amodulefiledefinesadditionstoenvironmentvariablessuchasPATH,LD_LIBRARY_PATH,and
MANPATH.
Cluster users use the module command to load or remove modules from their environment. The
module(1)manpagehasmoredetailsaboutthecommand,andaspectsofthemodulesenvironmentthat
arerelevantforadministratorsarediscussedinsection2.2oftheAdministratorManual. Alsodiscussed
thereisLmod,theLua-basedalternativetotheTcl-basedtraditionalmodulesenvironmentpackage.
Themodulesenvironmentfromauser’sperspectiveiscoveredinsection2.3oftheUserManual.
7.2 Shorewall
Packagename: shorewall
7.2.1 TheShorewallServiceParadigm
BCMprovidestheShorelineFirewall(morecommonlyknownas“Shorewall”)packagefromtheBCM
repository. Thepackageprovidesfirewallandgatewayfunctionalityontheheadnodeofacluster.
Shorewallisaflexibleandpowerfulhigh-levelinterfaceforthenetfilterpacketfilteringframework.
Netfilter is a standard part of Linux kernels. As its building blocks, Shorewall uses iptables and
iptables6commandstoconfigurenetfilter. Allaspectsoffirewallandgatewayconfigurationarehan-
dledthroughtheconfigurationfileslocatedunder/etc/shorewall/.
Shorewall IPv4 configuration is managed with the shorewall command, while IPv6 configuration
ismanagedviatheshorewall6command. IPv4filteringandIPv6filteringaretreatedasseparateser-
vicesinShorewall. Forconvenience,onlyIPv4Shorewallisdescribedfromhereonward,becauseIPv6
managementislargelysimilar.
AftermodifyingShorewallconfigurationfiles,Shorewallmustberestartedtohavethenewconfig-
urationtakeeffect. Fromtheshellprompt,thiscanbecarriedoutwith:

74 ThirdPartySoftware
service shorewall restart
In NVIDIA Base Command Manager 11, Shorewall is managed by CMDaemon, in order to han-
dle theautomation ofcloud nodeaccess. RestartingShorewall canthus also becarried outwithin the
services submode (section 3.14 of the Administrator Manual) of cmsh on the head node. For example,
onaheadnodebasecm11arestartofshorewallcanbecarriedoutwith:
[basecm11->device[basecm11]->services[shorewall]]% restart
restart Successfully restarted service shorewall on: basecm11
SystemadministratorsmaysometimesneedtobeawarethatShorewalldoesnotreallyrunasadae-
monprocess. Thatis,thecommandtorestarttheservicedoesnotstopandstartashorewalldaemon.
Insteadthecommandconfiguresnetfilterusingtheiptablessettingsspecifiedintheshorewallconfigu-
rationfiles, andthenexits. Itexitswithoutleavingashorewallprocessupandrunning, eventhough
service shorewall statusimpliesthatsuchaserviceisrunning.
7.2.2 ShorewallZones,Policies,AndRules
Inthedefaultsetup,Shorewallprovidesgatewayfunctionalitytotheinternalclusternetworkonthefirst
network interface (eth0). This network is known as the nat zone to Shorewall. The external network
(i.e. theconnectiontotheoutsideworld)isassumedtobeonthesecondnetworkinterface(eth1). This
networkisknownasthenetzoneinShorewall.
Letting BCM take care of the network interfaces settings is recommended for all interfaces on the
headnode(section3.2oftheAdministratorManual). Thefile/etc/shorewall/interfacesisgenerated
bytheclustermanagementdaemon,andanyextrainstructionsthatcannotbeaddedviaBaseViewor
cmshcanbeaddedoutsideofthefilesectionclearlydemarcatedasbeingmaintainedbyCMDaemon.
Shorewall is configured by default (through /etc/shorewall/policy) to deny all incoming traffic
fromthenetzone,exceptforthetrafficthathasbeenexplicitlyallowedin/etc/shorewall/rules. Pro-
viding(asubsetof)theoutsideworldwithaccesstoaservicerunningonacluster,canbeaccomplished
bycreatingappropriaterulesin/etc/shorewall/rules.
ArulemodificationistypicallyneededifShorewalldeniesaccesstoaport, ontheheadnode, that
needstobeaccessedfromanexternalnetwork. Theaccessmightbe,forexample,forcarryingoutport
forwardingfromtheheadnodetoacomputenodewhenusingtheportforwardcommand(page115of
theAdministratorManual).
Bydefault,theclusterrespondstoICMPpingpackets.Also,duringclusterinstallation,thefollowing
portsareopenbydefault,butcanbesettobeblockedbytheadministrator:
• SSH
• HTTP
• HTTPS
• port8081,whichallowsaccesstotheclustermanagementdaemon.
Thecm-cmd-portsUtility
Port8081isthedefaultportthatCMDaemonlistenstowhenusingtheHTTPSprotocoltomanagethe
nodes. If,forexample,anewsoftwareneedsthatport,thencm-cmd-portsutilitycanbeusedtosetthe
HTTPSprotocolportthatCMDaemonlistensontoanotherport,suchas8082.
Example
[root@basecm11 ~]# cm-cmd-ports --https 8082
A restart of CMDaemon has the change take effect, and takes care of opening the firewall on port
8082 for CMDaemon, by adding a line to the rules file of Shorewall. The original port 8081 remains
open,butCMDaemonnolongerlistenstoit.
Thestatusofportsusedbytheclustermanagercanbelistedwith:

7.2Shorewall 75
[root@basecm11 ~]# cm-cmd-ports -l
type http https firewall rule path
-------------- ------ ------- --------------- -------------------------------------------------------
image 8080 8082 /cm/images/default-image/cm/local/apps/cmd/etc/cmd.conf
image 8080 8082 True /cm/local/apps/cmd/etc/cmd.conf
node-installer 8082 /cm/node-installer/scripts/node-installer.conf
7.2.3 ClearAndStopBehaviorInserviceOptions,bashShellCommand,AndcmshShell
To remove all rules, for example for testing purposes, the clear option should be used from the Unix
shell. Thisthenallowsallnetworktrafficthrough:
shorewall clear
Administrators should be aware that in the Linux distributions supported by BCM, the service
shorewall stop command corresponds to the unix shell shorewall stop command, and not to the
unixshellshorewall clearcommand. Thestopoptionfortheserviceandshellblocksnetworktraffic
but allows a pre-defined minimal safe set of connections, and is not the same as completely remov-
ing Shorewall from consideration. The stop options discussed so far should not be confused with the
equivalentstopoptioninthecmshshellunderservicesmodeunderdevicemode.
Thissituationisindicatedinthefollowingtable:
Correspondenceofstop,clear,andrestartinShorewallvscmsh
iptablesrules Service UnixShell cmshshell
keepasafeset: serviceshorewallstop shorewallstop noequivalent
clearallrules: noequivalent shorewallclear stopshorewall
startwithstoredrules: serviceshorewallrestart shorewallrestart restartshorewall
7.2.4 AddingToShorewallConfigurationViaARoleIncmsh
Thissection,aboutaddingtoShorewallconfigurationviaaroleincmsh,requiressomefamiliaritywith
BCM and Shorewall, and can be skipped at a first reading of the manuals. For convenience, cross-
references are provided within this section to the material that the administrator should have some
familiaritywithbeforeconfiguringShorewallviaarole.
The command line front end manager to BCM is cmsh (section 2.5 of the Administrator Manual).
Withincmsh,servicesareoftenimplementedasroles(section2.1.5oftheAdministratorManual).
AdministratorsthathavebecomefamiliarwithusingroleswithincmshcancarryoutsomeShorewall
configuration within the firewall role of the head node, via modes (section 2.5.2 of the Administrator
Manual)underthefirewallrole. FirewallmodeswereintroducedinBCMversion9.1.
Shorewall configuration can go far beyond just what can be done within the modes of firewall.
ThesemodesarejusttheBCMwaytoaddchangestosomeShorewallfirewallconfigurations,andare
aimedatmakingfirewallmanagementfortheclustereasier.
BCMprovidesmodesformodifyingShorewallfilesasindicatedbythefollowingtable:

76 ThirdPartySoftware
| mode | usedformodifying: |     |     | Shorewallfilemanpages |
| ---- | ----------------- | --- | --- | --------------------- |
policies policiesin/etc/shorewall/policy https://shorewall.org/manpages/
shorewall-policy.html
routes routes/etc/shorewall/routes https://shorewall.org/manpages/
shorewall-routes.html
(not present
inUbuntuclustersbydefault)
interfaces interfacesin/etc/shorewall/interfaces https://shorewall.org/manpages/
shorewall-interfaces.html
zones zonesin/etc/shorewall/zones https://shorewall.org/manpages/
shorewall-zones.html
openports portsin/etc/shorewall/rules https://shorewall.org/manpages/
shorewall-rules.html
Forexample,toaddapolicytotheBCM-managedsectionofthe/etc/shorewall/policyfileonthe
headnode,acmshsessioncanberunasfollows:
Example
| [root@head                             | ~]# cmsh   |             |          |     |
| -------------------------------------- | ---------- | ----------- | -------- | --- |
| [head]%                                | device use | head; roles |          |     |
| [head->device[head]->roles]%           |            | use         | firewall |     |
| [head->device[head]->roles[firewall]]% |            |             | show     |     |
| Parameter                              |            |             | Value    |     |
-------------------------------- ------------------------------------------------
| Name |     |     | firewall |     |
| ---- | --- | --- | -------- | --- |
Revision
| Type                                             |               |              | FirewallRole           |      |
| ------------------------------------------------ | ------------- | ------------ | ---------------------- | ---- |
| Add services                                     |               |              | yes                    |      |
| Shorewall                                        |               |              | no                     |      |
| Open ports                                       |               |              | <0 in submode>         |      |
| Zones                                            |               |              | <0 in submode>         |      |
| Interfaces                                       |               |              | <0 in submode>         |      |
| Policies                                         |               |              | <0 in submode>         |      |
| Routes                                           |               |              | <0 in submode>         |      |
| [head->device[head]->roles[firewall]]%           |               |              | policies               |      |
| [head->device[head]->roles[firewall]->policies]% |               |              |                        | list |
| Index                                            | Source Dest   | Policy       | Log Options            |      |
| ------                                           | ------ ------ | ------------ | --------- ------------ |      |
TheprecedingoutputshowsnoadditionalpoliciesarecurrentlymanagedbyBCMinthatmode.Toadd
someBCM-managedpolicies,theadministratorcancheckhowtodoitbytypingintheaddcommand
(section2.5.3oftheAdministratorManual)withoutanyarguments:
| [head->device[head]->roles[firewall]->policies]% |     |     |     | add |
| ------------------------------------------------ | --- | --- | --- | --- |
Name:
|     | Create a | new firewallpolicy | with specified | policy |
| --- | -------- | ------------------ | -------------- | ------ |
Usage:
add <policy>
add <source>
|     | add <source> | <dest> |                          |     |
| --- | ------------ | ------ | ------------------------ | --- |
|     | add <source> | <dest> | <policy>                 |     |
|     | add <source> | <dest> | <policy> <log>           |     |
|     | add <source> | <dest> | <policy> <log> <options> |     |

7.2Shorewall 77
Examples:
add loc net ACCEPT
|     | add loc net ACCEPT | info |     |     |
| --- | ------------------ | ---- | --- | --- |
BasedonthelookupandsomefamiliaritywithShorewall’spolicyfile,theadministratorcannowcom-
pose suitable arguments for the add command, and commit (section 2.5.3 of the Administrator Manual)
thechanges:
Example
[head->device[head]->roles[firewall]->policies]% add net fw ACCEPT info
[head->device*[head*]->roles*[firewall*]->policies[0]]% #preceding means accept all traffic from other subnets
| [head->device*[head*]->roles*[firewall*]->policies[0]]% |                     |                        | list |     |
| ------------------------------------------------------- | ------------------- | ---------------------- | ---- | --- |
| Index Source                                            | Dest Policy         | Log Options            |      |     |
| ------ ------                                           | ------ ------------ | --------- ------------ |      |     |
| 0 net                                                   | fw ACCEPT           | info                   |      |     |
[head->device*[head*]->roles*[firewall*]->policies[0]]% #next lines show how policy section changes on commit
[head->device*[head*]->roles*[firewall*]->policies[0]]% !head -4 /etc/shorewall/policy
# This section of this file was automatically generated by cmd. Do not edit manually!
| # BEGIN AUTOGENERATED                                   | SECTION | -- DO NOT REMOVE |        |     |
| ------------------------------------------------------- | ------- | ---------------- | ------ | --- |
| # END AUTOGENERATED                                     | SECTION | -- DO NOT REMOVE |        |     |
| [head->device*[head*]->roles*[firewall*]->policies[0]]% |         |                  | commit |     |
[head->device[head]->roles[firewall]->policies]% !head -4 /etc/shorewall/policy
# This section of this file was automatically generated by cmd. Do not edit manually!
| # BEGIN AUTOGENERATED | SECTION     | -- DO NOT REMOVE |     |     |
| --------------------- | ----------- | ---------------- | --- | --- |
| net fw                | ACCEPT info |                  |     |     |
| # END AUTOGENERATED   | SECTION     | -- DO NOT REMOVE |     |     |
Afterthecommitcommandisrun,theadditionalpolicyisplacedandbecomesactiveinthepolicyfile.
7.2.5 FurtherShorewallQuirks
ShorewallIsNormallyOnlyOnTheHeadNode
Shorewallalwaysrunsontheheadnode.
Shorewallcanalsorunontheregularnodes,butdoesnotrunonthembydefault.
Inatype1networktopology(section3.3.9),runningShorewallontheregularnodesmakesnoreal
sense from a security point of view. This is because the head node controls all the regular nodes, and
accesstotheregularnodesisthroughtheheadnodefirewall.
Fortype2andtype3topologies,turningShorewallonfortheregularnodesmustbeconsidered. It
canbeturnedonbysettingtheshorewallattributeinthefirewallroleforthenodefromofftoon.
Example
| [basecm11->device*[node001*]->roles*[firewall*]]% |     |     | get shorewall |     |
| ------------------------------------------------- | --- | --- | ------------- | --- |
no
[basecm11->device*[node001*]->roles*[firewall*]]% !ssh node001 systemctl status shorewall.service
...
| Active: inactive | (dead) |     |     |     |
| ---------------- | ------ | --- | --- | --- |
...
| [basecm11->device*[node001*]->roles*[firewall*]]% |     |       | set shorewall | on  |
| ------------------------------------------------- | --- | ----- | ------------- | --- |
| [basecm11->device*[node001*]->roles*[firewall*]]% |     |       | commit ; show |     |
| Parameter                                         |     | Value |               |     |
-------------------------------- ------------------------------------------------
| Name |     | firewall |     |     |
| ---- | --- | -------- | --- | --- |
Revision

78 ThirdPartySoftware
Type FirewallRole
Add services yes
Shorewall yes
...
[basecm11->device[node001]->roles[firewall]]% !systemctl status shorewall.service
ssh: connect to host node001 port 22: Connection refused
StandardDistributionFirewallShouldBeDisabled
Administrators should also be aware that RHEL and its derivatives run their own set of high-level
iptables setup scripts if the standard distribution firewall is enabled. To avoid conflict, the standard
distribution firewall, Firewalld, must stay disabled in RHEL8 and 9 and their derivatives. This is be-
causeBCMrequiresShorewallforregularfunctioning. Shorewallcanbeconfiguredtosetupwhatever
iptablesrulesareinstalledbythestandarddistributionscriptinstead.
ShorewallStoppedOutsideOfBCMConsideredHarmful
System administrators wishingto stop Shorewall shouldnote that BCM bydefault has the autostart
setting(section3.14oftheAdministratorManual)settoon. Withsuchavalue,CMDaemonattemptsto
restartastoppedShorewalliftheservicehasbeenstoppedfromoutsideofcmshorBaseView.
Stopping Shorewall outside of cmsh or Base View is considered harmful, because it can trigger a
failover. ThisisbecausestoppingShorewallblocksthefailoverpreventionmonitoringtests. Thesetests
are the status ping and backup ping (both based on ICMP packet connections), and the CMDaemon
status (based on REST calls) (section 15.4.2 of the Administrator Manual). In most cases, with default
settings, Shorewall is not restarted in time, even when autostart is on, so that a failover then takes
place.
A failover procedure is quite a sensible option when Shorewall is stopped from outside of cmsh or
BaseView,becausebesidesthefailovermonitoringtestsfailing,otherfailuresalsomaketheheadnode
prettyuseless. Theblockingofportsmeansthat,amongstothers,workloadmanagersandNFSshares
are also unable to connect. Ideally, therefore, Shorewall should not be stopped outside cmsh or Base
Viewinthefirstplace.
FulldocumentationonthespecificsofShorewallisavailableathttp://www.shorewall.net.
7.3 The GCC Compiler
TheGCCcompilermaybeinstalledthroughyum,zypper,orapt(section9.2oftheAdministratorManual).
Thepackagenamesare
• gcc-recentforRHELandderivatives,andSLES
• cm-gccforUbuntu
TheGCCsuitethatthedistributionprovidesisalsopresentbydefault.
AnalternativetotheGCCcompileristheIntelcompiler,whichispartoftheoneAPItoolkit,available
fromhttps://www.intel.com/content/www/us/en/developer/tools/oneapi/toolkits.html.Earlier
versions of BCM had the Intel compiler components available from the BCM repositories; this is no
longerthecaseforBCM10.0andonward.
7.4 AMD GPU Driver Installation
AMDGPUsrequiredriverstobeinstalledinordertowork.TheDKMSsystem,whichisusedtocompile
kernelmodulesthatarenotpartofthemainlinekernel,isusedforcreatingAMDGPUkernelmodules
ontheimagetobeusedbythenodesthathaveGPUs.

7.4AMDGPUDriverInstallation 79
7.4.1 AMDGPUHardwareCheck
AhardwarechecktoseeifthenodehasanAMDGPUis:
Example
| [root@node001 | ~]# lspci | | grep AMD |     |     |     |
| ------------- | --------- | ---------- | --- | --- | --- |
10\
00:06.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Vega
| [Instinct | MI25/MI25x2/V340/V320] |     |     |     |     |
| --------- | ---------------------- | --- | --- | --- | --- |
IfthekernelhasdetectedtheAMDGPU,thenagrep amdgpuofthedmesgoutputshowsallsortsof
messagesthatindicatethat:
Example
| [root@node001 | ~]# dmesg    | | grep amdgpu |                  |                    |     |
| ------------- | ------------ | ------------- | ---------------- | ------------------ | --- |
| [ 157.942430] | [drm] amdgpu | kernel        | modesetting      | enabled.           |     |
| [ 157.945225] | amdgpu:      | CRAT table    | not found        |                    |     |
| [ 157.945241] | amdgpu:      | Virtual CRAT  | table created    | for CPU            |     |
| [ 157.945265] | amdgpu:      | Topology:     | Add CPU node     |                    |     |
| [ 158.211025] | amdgpu       | 0000:00:06.0: | amdgpu:          | Fetched VBIOS from | ROM |
| [ 158.211065] | amdgpu:      | ATOM BIOS:    | 113-D0513600-109 |                    |     |
[ 158.226062] amdgpu 0000:00:06.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
| [ 159.253402] | amdgpu | 0000:00:06.0: | amdgpu: | MEM ECC is active. |     |
| ------------- | ------ | ------------- | ------- | ------------------ | --- |
[ 159.253418] amdgpu 0000:00:06.0: amdgpu: SRAM ECC is not presented.
[ 159.253465] amdgpu 0000:00:06.0: amdgpu: VRAM: 16368M 0x000000F400000000 - 0x000000F7FEFFFFFF (16368M used)
...
7.4.2 AMDGPUDriverInstallationPerSupportedDistribution
Acrossthedistributions—RHELandderivatives,Ubuntu,andSLES—theproceduretoinstalltheGPU
driversisverysimilar.
CloningAnImageForAMDGPUNodes
Inalldistributions,thedefault-imagecanfirstbeclonedtoanimagethatistobetheAMDGPUimage,
forexampleam:
Example
| [root@basecm11:~]#               | cmsh          |       |               |     |     |
| -------------------------------- | ------------- | ----- | ------------- | --- | --- |
| [basecm11]%                      | softwareimage |       |               |     |     |
| [basecm11->softwareimage]%       |               | clone | default-image | am  |     |
| [basecm11->softwareimage*[am*]]% |               |       | commit        |     |     |
[basecm11->softwareimage[am]]%
[notice] basecm11: Started to copy: /cm/images/default-image -> /cm/images/am (4117)
...
[notice] basecm11: Initial ramdisk for image am was generated successfully
| [basecm11->softwareimage[am]]% |     | quit |     |     |     |
| ------------------------------ | --- | ---- | --- | --- | --- |
AMDInstructionsForInstallingTheDriverPackagesOnAMDGPUNodes
Instructions from AMD describe how to install the driver packages. At the time of writing (February
2024)theinstructionsareat:
https://rocm.docs.amd.com/projects/install-on-linux/en/latest/tutorial/quick-start.
html
Theinstructionsdescribetwowaysofinstallingthedriver:
1. configuringtheAMDdriverrepositoryforthepackagemanager,andtheninstallingthedrivervia
standardpackagemanagercommandsandOSchanges

80 ThirdPartySoftware
2. installinganAMDGPUinstallerthattakescareoftheinstallation
In either case, the instructions that are followed must be the ones for the OS release version of the
softwareimagethatisontheAMDGPUnodes. Thereleaseversioncanbefoundwith:
Example
| root@basecm11:~#   | grep PRETTY | /etc/os-release |        |
| ------------------ | ----------- | --------------- | ------ |
| PRETTY_NAME="Rocky | Linux       | 9.2 (Blue       | Onyx)" |
InstallingTheDriverPackagesOnAMDGPUNodesOnTheNodeImagesViaChroot
The installation must be done in the image. This is done using a chroot into the image, and using a
bind mount to have some special filesystem directories (/proc, /sys, and similar) be available during
| thepackageinstallation. | ThisisneededfortheDKMSinstallation. |     |     |
| ----------------------- | ----------------------------------- | --- | --- |
Bindmountingthefilesystemsandthenchrootingisalittletedious,sothecm-chroot-sw-imgutility
(page530oftheAdministratorManual)isusedtoautomatethejob.
Thefollowingsessionoutputillustrates(withmuchtextelided)theprocedureforthesecondofthe
twowaysofinstallingthedriver. Thatis,installingandrunningtheAMDGPUinstalleronasoftware
image:
Thechrootedimagecreatedearlier(am)isfirstentered:
Example
| [root@basecm11 | ~]# cm-chroot-sw-img |     | /cm/images/am/ |
| -------------- | -------------------- | --- | -------------- |
mounted /cm/images/default-image/dev
mounted /cm/images/default-image/dev/pts
...
Theamdgpu-installpackagecanthenbeinstalled,aspertheAMDinstructions. Thepackagepro-
videstheAMDGPUinstaller(amdgpu-install),whichisruninachrootedimagetoinstalltheROCm
stack.Installationtakesawhile,withmuchofthetimetakenupbythecompilationstepsthatarecarried
outfortheDKMSparts.
• ForRHEL9.2andderivativestheprocedurelookslike:
Example
| [root@am | /]# urldomain=https://repo.radeon.com |     |     |
| -------- | ------------------------------------- | --- | --- |
[root@am /]# urlpath=/amdgpu-install/6.0.2/rhel/9.2/amdgpu-install-6.0.60002-1.el9.noarch.rpm
| [root@am | /]# yum install | $urldomain$urlpath |     |
| -------- | --------------- | ------------------ | --- |
...
| [root@am | /]# amdgpu-install |     | --usecase=graphics,rocm |
| -------- | ------------------ | --- | ----------------------- |
...
Theexactpathdependsonwhichversionisused.
• ForUbuntu22.04(JammyJellyfish)theprocedurelookslike:
Example
| root@am:/# | urldomain=https://repo.radeon.com |     |     |
| ---------- | --------------------------------- | --- | --- |
root@am:/# urlpath=/amdgpu-install/6.0.2/ubuntu/jammy/amdgpu-install_6.0.60002-1_all.deb
| root@am:/# | wget $urldomain$urlpath |     |     |
| ---------- | ----------------------- | --- | --- |
...
| root@am:/# | apt install | ./amdgpu-install_6.0.60002-1_all.deb |     |
| ---------- | ----------- | ------------------------------------ | --- |
...
| root@am:/# | amdgpu-install |     | --usecase=rocm |
| ---------- | -------------- | --- | -------------- |
...

7.4AMDGPUDriverInstallation 81
• ForSLES15theprocedureforSLES15sp5lookslike:
Example
| am:/ | # urldomain=https://repo.radeon.com |     |     |     |     |
| ---- | ----------------------------------- | --- | --- | --- | --- |
am:/ # urlpath=/amdgpu-install/latest/sle/15.5/amdgpu-install-6.0.60000-1.noarch.rpm
| am:/ | # zypper | --no-gpg-checks |     | install | $urldomain$urlpath |
| ---- | -------- | --------------- | --- | ------- | ------------------ |
...
| am:/ | # amdgpu-install |     | --usecase=graphics,rocm |     |     |
| ---- | ---------------- | --- | ----------------------- | --- | --- |
...
Theexactpathdependsonwhichservicepack(sp)versionisinuseonthenode.
ReplacingTherocm-smiPackageWithAPackageFromBCMOnTheAMDGPUNodesImage
rocm-smi
Running the AMDGPU installer installs the command, which is used for some monitoring
tasks related to AMD GPUs. BCM requires its own version of this command to collect AMD GPU
statistics. If such statistics are needed, then the BCM cm-rocm-smi package should be installed in the
imagetoo,toprovidetheBCMversion:
| [root@am | /]# yum | install | cm-rocm-smi | forRHELandderivatives |     |
| -------- | ------- | ------- | ----------- | --------------------- | --- |
ForUbuntu,theequivalentinstallationcommandisapt install cm-rocm-smi,whileforSLESitis
| zypper | install | cm-rocm-smi. |     |     |     |
| ------ | ------- | ------------ | --- | --- | --- |
The chroot for the prepared image can now be exited, which automatically unmounts the bind
mounts:
Example
| [root@am | /]# exit              |     |     |     |     |
| -------- | --------------------- | --- | --- | --- | --- |
| umounted | /cm/images/am/dev/pts |     |     |     |     |
| umounted | /cm/images/am/dev     |     |     |     |     |
| umounted | /cm/images/am/proc    |     |     |     |     |
| umounted | /cm/images/am/sys     |     |     |     |     |
| umounted | /cm/images/am/run     |     |     |     |     |
UsingTheImageForTheAMDGPUNodes
Thenodesthataretousethedrivershouldthenbesettousethenewimage,andshouldberebooted:
Example
| [root@basecm11                 | ~]#    | cmsh        |                   |         |     |
| ------------------------------ | ------ | ----------- | ----------------- | ------- | --- |
| [basecm11]%                    | device | use node001 |                   |         |     |
| [basecm11->device[node001]]%   |        |             | set softwareimage |         | am  |
| [basecm11->device*[node001*]]% |        |             | commit            |         |     |
| [basecm11->device[node001]]%   |        |             | reboot            | node001 |     |
NormalnodeswithouttheAMDGPUalsobootupwithoutcrashingiftheyaresettousethisimage,
butwillnotbeabletorunOpenCLprograms.
After the configuration file has been placed, the ldconfig command is run, still within chroot, to
linkthelibraryintheimage(s).

8
|     |     | The | NVIDIA | HPC | SDK |
| --- | --- | --- | ------ | --- | --- |
The NVIDIA HPC software development kit (https://developer.nvidia.com/hpc-sdk) is a suite of
compilers,libraries,andothertoolsforHPC.
Featuresinclude:
• The NVIDIA HPC SDK C, C++, and Fortran compilers that support GPU acceleration of HPC
modelingandsimulationapplicationswithstandardC++andFortran,OpenACCdirectives,and
CUDA.
• GPU-acceleratedmathlibrariesthatmaximizeperformanceoncommonHPCalgorithms,andop-
timized communications libraries enable standards-based multi-GPU and scalable systems pro-
gramming.
• PerformanceprofilinganddebuggingtoolsthatsimplifyportingandoptimizationofHPCappli-
cations
• Containerizationtoolsthatenableeasydeploymenton-premisesorinthecloud.
• SupportforARM,OpenPOWER,x86-64CPUs,aswellasNVIDIAGPUs,runningLinux
| 8.1 Packages | And | Versions |     |     |     |
| ------------ | --- | -------- | --- | --- | --- |
The main NVIDIA HPC SDK package is available as a package cm-nvhpc. The cm-nvhpc package, in
turn, depends on a package with the naming format cm-nvhpc-cuda<number>. Here, <number> is a
CUDAversionnumber.
ThelatestCUDAversionnumberthatiscompatiblewiththecm-nvhpcpackageversionatthetime
ofreleaseissetasthepackagedependency.OlderCUDApackagesareoptionalbutcanalsobeinstalled.
Acommandlinewaytocheckthereleaseversionsandavailabilityisasindicatedbythefollowing
outputsforaRockyLinux9.3cluster:
Example
| [root@basecm11 | ~]# yum | info cm-nvhpc    | | grep ^Version |     |     |
| -------------- | ------- | ---------------- | --------------- | --- | --- |
| Version        | : 25.3  |                  |                 |     |     |
| [root@basecm11 | ~]# yum | install cm-nvhpc |                 |     |     |
...
| Installing | dependencies: |     |     |     |     |
| ---------- | ------------- | --- | --- | --- | --- |
cm-nvhpc-cuda12.8
..
| [root@basecm11 | ~]# yum | search cm-nvhpc-cuda* |     |     |     |
| -------------- | ------- | --------------------- | --- | --- | --- |
...
| cm-nvhpc-cuda11.8.x86_64 |     | : NVIDIA | HPC SDK |     |     |
| ------------------------ | --- | -------- | ------- | --- | --- |
| cm-nvhpc-cuda12.6.x86_64 |     | : NVIDIA | HPC SDK |     |     |
| cm-nvhpc-cuda12.8.x86_64 |     | : NVIDIA | HPC SDK |     |     |

84 TheNVIDIAHPCSDK
The preceding output is what was available at the time of writing (June 2025). The output can be
expectedtochange.
A browser-based way to check the cm-nvhpc versions and CUDA availability situation for BCM
versions,distributionsandarchitectureistousecm-nvhpcasastringinthedistributedpackageslistfor
BCMathttps://service.bcm.nvidia.com/packages-dashboard
| 8.2 Compiler | Modules |     |     |
| ------------ | ------- | --- | --- |
Thecm-nvhpcpackagemakesseveralenvironmentmodulesavailableforcompiling:
’ ’
| [root@basecm11 | ~]# module | avail | grep | -o -P nvhpc.*?/ |
| -------------- | ---------- | ------------ | --------------- |
nvhpc-hpcx-cuda11/
nvhpc/
nvhpc-hpcx-cuda12/
nvhpc-byo-compiler/
nvhpc-hpcx/
nvhpc-hpcx-2.20-cuda12/
nvhpc-nompi/
Thenvhpc-hpcx-cuda11ornvhpc-hpcx-cuda12environmentmodulesetsuptheHPC-Xlibraryen-
vironmentwiththeselectedCUDAversion.
Thenvhpc-hpcxenvironmentmodulesetsuptheHPC-Xlibraryenvironment. Thisisanalternative
totheOpenMPI3.xlibrary.
ThenompitagimpliesthatpathstotheMPIbinariesandMPIlibrariesthatcomewithcm-nvhpcare
notset,sothatnoMPIlibraryisusedfromthepackage. AnexternalMPIlibrarycanthenbeusedwith
thenvhpc-nompicompiler.
ThenvhpcenvironmentmoduleisthestandardHPCSDK.
Thebyotagisanabbreviationfor’bring-your-own’, andmeansthatthegeneralcompilerenviron-
mentforC,C++andFortranarenotset.
8.3 Viewing Installed Available CUDA Versions, And The Running CUDA
Version
TheinstalledavailableCUDAversionsfornvhpccanbeviewedwith:
Example
| [root@basecm11] | ~# module   | load shared | nvhpc                        |
| --------------- | ----------- | ----------- | ---------------------------- |
| [root@basecm11] | ~# basename | -a $(ls     | -1d $NVHPC_ROOT/cuda/[0-9]*) |
12.6
12.8
TherunningCUDAversionfornvhpccanbeviewedwith:
Example
| [root@basecm11   | ~]# nvcc                     | --version          |          |
| ---------------- | ---------------------------- | ------------------ | -------- |
| nvcc: NVIDIA     | (R) Cuda                     | compiler driver    |          |
| Copyright        | (c) 2005-2025                | NVIDIA Corporation |          |
| Built on         | Fri_Feb_21_20:23:50_PST_2025 |                    |          |
| Cuda compilation | tools,                       | release 12.8,      | V12.8.93 |
Build cuda_12.8.r12.8/compiler.35583870_0

8.4ChangingTheRunningCUDAVersion 85
8.4 Changing The Running CUDA Version
In the preceding example, CUDA version 12.8 is the default version, while CUDA version 12.6 is also
seentobeavailable.
TheCUDAversionthatisusedcanbechangedonthenodeswherenvhpcandtheCUDAversions
havebeeninstalled.
Forexample,theversioncanbechangedtoversion12.6,asfollows,for:
• nvhpccluster-wide:
[root basecm11] # makelocalrc ${NVHPC_ROOT}/compilers/bin -cuda 12.6 -x
• nvhpconaspecificheadorcomputenode,asspecifiedbyhostname -s:
[root basecm11] # makelocalrc ${NVHPC_ROOT}/compilers/bin -cuda 12.6 -o > \
${NVHPC_ROOT}/compilers/bin/localrc.$(hostname -s)
• nvhpcforaspecificuseronaspecificheadorcomputenode,asspecifiedbyhostname -s:
[root basecm11] # makelocalrc ${NVHPC_ROOT}/compilers/bin -cuda 12.6 -o > \
${HOME}/localrc.$(hostname -s)
Ifthenvhpccompilerisrunthen:
1. the${NVHPC_ROOT}/compilers/bin/localrcconfigurationfileisread,
2. followedbyasecondconfigurationfile,which—ifitexists—iseither:
• the${NVHPC_ROOT}/compilers/bin/localrc.$(hostname -s)configurationfile
or
• the${HOME}/localrc.$(hostname -s)configurationfile
Thesecondconfigurationfileoverwritesanysettingssetwith${NVHPC_ROOT}/compilers/bin/localrc
If the ${NVHPC_ROOT}/compilers/bin/localrc.$(hostname -s) configuration file exists, then a
${HOME}/localrc.$(hostname -s)isignored.

9
CUDA For GPUs
The optional CUDA packages should be deployed in order to take advantage of the computational
capabilitiesofNVIDIAGPUs. Thepackagesmayalreadybeinplace,andreadyfordeploymentonthe
cluster,dependingontheparticularBCMsoftwarethatwasobtained. IftheCUDApackagesarenotin
place,thentheycanbepickedupfromtheBCMrepositories,oralocalmirror.
9.1 Installing CUDA
9.1.1 CUDAPackagesAvailable
At the time of writing of this section (April 2026), the CUDA 13.1 package is the most recent version
availableintheBCMYUM,zypper,andAPTrepositories. Theavailableversionsareupdatedtypically
in the next point release version of NVIDIA Base Command Manager after the upstream changes are
made available. An up-to-date list of packages available for a particular distribution and architecture
canbeviewedathttps://service.bcm.nvidia.com/packages-dashboard/.
Thus, for example, at the time of writing, Rocky Linux 9.6 has many CUDA versions available,
in the range from CUDA 11.7 to CUDA 13.1 for the x86_64 architecture, while Ubuntu 24.04 just has
CUDA12.5,CUDA12.6,CUDA12.8,CUDA12.9,CUDA-13.0,andCUDA13.1forx86_64.
Example: CUDAPackagesAvailableForUbuntu24.04
Atthetimeofwritingofthissection(April2026),aclusteradministratorcanmanagethesepackagesfor
Ubuntu24.04:

88 CUDAForGPUs
| Package |     | Type | Description |
| ------- | --- | ---- | ----------- |

cuda12.5-toolkit 
| c u d a 1 2 . | 6 - t o o l k i t |     |     |
| ------------- | ----------------- | --- | --- |
| c u d a 1 2 . | 8 - t o o l k i t |     |     |
shared CUDAmathlibrariesandutilities
| c u d a 1 2 . | 9 - t o o l k i t |  |     |
| ------------- | ----------------- | ---------- | --- |
| c u d a 1 3 . | 0 - t o o l k i t |            |     |
| c u d a 1 3 . | 1 - t o o l k i t |            |     |

cuda12.5-visual-tools

| c u d a 1 2 . | 6 - v i s u a l - t | o o l s |     |
| ------------- | ------------------- | ------- | --- |
| c u d a 1 2 . | 8 - v i s u a l - t | o o l s |     |
shared CUDAvisualtoolkit
| c u d a 1 2 . | 9 - v i s u a l - t | o o l s |     |
| ------------- | ------------------- | ------- | --- |

| c u d a 1 3 . | 0 - v i s u a l - t | o o l s |     |
| ------------- | ------------------- | ------- | --- |
| c u d a 1 3 . | 1 - v i s u a l - t | o o l s |     |

cuda12.5-sdk

| c u d a 1 2 . | 6 - s d k |     |     |
| ------------- | --------- | --- | --- |
| c u d a 1 2 . | 8 - s d k |     |     |
shared CUDAsoftwaredevelopmentkit
| c u d a 1 2 . | 9 - s d k |  |     |
| ------------- | --------- | ---------- | --- |
| c u d a 1 3 . | 0 - s d k |            |     |
| c u d a 1 3 . | 1 - s d k |            |     |
nvidia-driver∗∗,†
local CUDAGPUdriverandlibraries.
| cuda-dcgm |     | local | CUDADataCenterGPUManager(DCGM). |
| --------- | --- | ----- | ------------------------------- |
ThisincludesthedcgmiCLItool.
(cid:41)
nvidia-fabricmanager∗,∗∗
local FabricManagertools
nvidia-fabricmanager-dev∗,∗∗
*optional,intendedonlyforhardwarecontaininganNVSwitch,suchasaDGXsystem
**installedbydefaultonsoftwareimages,notonheadnodes
†thedrivertypicallyhasaversionnumbertagsuchas-590.
• The packages of type shared in the preceding table should be installed on the head nodes of a
clusterusingCUDA-compatibleGPUs.
• The packages of type local should be installed to all nodes that access the GPUs. In most cases
thismeansthatthe
– nvidia-driver(NVIDIAdrivermetapackage)
cuda-dcgm(NVIDIADataCenterGPUManager)
–
– nvidia-fabricmanager(FabricManagerforNVSwitchbasedsystems)
– nvidia-fabricmanager-dev(FabricManagerAPIheadersandassociatedlibrary)
packagesshouldbeinstalledinasoftwareimage(section2.1.2oftheAdministratorManual).Byde-
fault,BCMsoftwareimagesalreadyhavethesepackages,whichmeansthatanexplicitinstallation
bytheclusteradministratorshouldnotberequired.

9.1InstallingCUDA 89
If a head node also accesses GPUs, then the nvidia-driver and cuda-dcgm packages should be
installedonit,too.
Forpackagesoftypeshared,theparticularCUDAversionthatisrunonthenodecanbeselectedvia
amodulesenvironmentcommand. Forexample,toselectCUDASDKversion13.0,theusercanrun:
Example
user@basecm11:~$ module add shared cuda13.0
ReleasenotesandfeatureslistfortheCUDApackages:
• ReleasenotesfortheNVIDIAtoolkitcanbefoundat:
https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html
• ThefeatureslistfortheNVIDIAtoolkitcanbefoundat:
https://docs.nvidia.com/cuda/cuda-features-archive/index.html
CUDApackagesthattheclusteradministratornormallydoesnotmanage: Asanaside,therearealso
theadditionalCUDADCGMpackages:
Package Type Description InstallationonGPUnode
cuda-dcgm-libs local NVIDIADCGMlibraries installedbydefault
cuda-dcgm-devel local NVIDIADCGMdevelopmentfiles notinstalledbydefault
cuda-dcgm-nvvs local NVIDIADCGMvalidationsuite installed by default, except
forinRHEL8,andexceptfor
inaDGXnode
Atthetimeofwritingofthisparagraph(April2026)thelatestDCGMversionsupportedbyBCMwas
4.5.2. Runninga
• dnf info cuda-dcgm; dnf list cuda-dcgmforRHEL-familydistributions
• apt show -a cuda-dcgmforUbuntudistributions
shouldrevealthecurrentlyinstalledandavailableversionsforthecluster.
• Release notes for the DCGM versions are available at https://docs.nvidia.com/datacenter/
dcgm/latest/release-notes/changelog.html.
CUDAPackageThatTheClusterAdministratorMayWishToInstallForCUDAProgramming
CUB is a CUDA programming library that developers may wish to access. It is available for some
distributionsforsomeolderCUDAversions,andprovidedbythepackagecm-cub-cuda.
CUDAPackageInstallationBasicSanityCheck
• The NVIDIA GPU hardware should be detectable by the kernel, otherwise the GPUs cannot be
usedbythedrivers. RunningthelspcicommandonthedevicewiththeGPUbeforetheCUDA
package driver installation is a quick checkthat should make it clearif the NVIDIA hardware is
detectedinthefirstplace:
Example
runninglspcionnode001. Here4GPUsaredetected:

| 90  |     |     |     |     | CUDAForGPUs |
| --- | --- | --- | --- | --- | ----------- |
|     |     | ’   | ’   |     |             |
[root@node001]# { lspci | grep 3D controller: NVIDIA ;} && echo "NVIDIA GPU hardware detected by kernel"
| 0008:01:00.0 | 3D controller: | NVIDIA Corporation | Device | 2941 (rev a1) |     |
| ------------ | -------------- | ------------------ | ------ | ------------- | --- |
| 0009:01:00.0 | 3D controller: | NVIDIA Corporation | Device | 2941 (rev a1) |     |
| 0018:01:00.0 | 3D controller: | NVIDIA Corporation | Device | 2941 (rev a1) |     |
| 0019:01:00.0 | 3D controller: | NVIDIA Corporation | Device | 2941 (rev a1) |     |
| NVIDIA       | GPU hardware   | detected by kernel |        |               |     |
[root@node001]#
If the hardware is not detected by the kernel already, then the administrator should reassess the
situation.
TheDevice 2941partofthestringcanbetalliedagainsttheidentifiersintheREADME.txt.gzfile
ofthenvidia-driver-580packageseries,atthenodewhereithasbeeninstalled.
Example
root@basecm11:~# zgrep 2941 /cm/images/default-image/usr/share/doc/nvidia-driver-580/README.txt.gz
| NVIDIA | GB200 |     |     | 2941 10DE 2046 | K   |
| ------ | ----- | --- | --- | -------------- | --- |
| NVIDIA | GB200 |     |     | 2941 10DE 20CA | K   |
| NVIDIA | GB200 |     |     | 2941 10DE 20D5 | K   |
| NVIDIA | GB200 |     |     | 2941 10DE 21C9 | K   |
| NVIDIA | GB200 |     |     | 2941 10DE 21CA | K   |
Theoutputofthelspcicommandcanbemoredirectlyinformativeforsomehardware:
Example
| root@basecm11:~# | ssh | node001 "lspci | grep | 3D controller: | NVIDIA" |     |
| ---------------- | --- | --------------------- | -------------- | ------- | --- |
00:06.0 3D controller: NVIDIA Corporation GA100 [A100 PCIe 40GB] (rev a1)
root@basecm11:~# zgrep A100 /cm/images/default-image/usr/share/doc/nvidia-driver-580/README.txt.gz \
| | grep | -i PCIE | grep | 40GB |     |                |     |
| ------ | -------------- | ---- | --- | -------------- | --- |
| NVIDIA | A100-PCIE-40GB |      |     | 20F1 10DE 145F | J   |
• OnlyafterCUDApackageinstallationhastakenplace,andafterrebootingthenodewiththeGPU,
andallowingCMDaemonsometime(afewminutes)todetectthechange,areGPUdetailsvisible
usingthesysinfocommand:
Example
runningsysinfoonnode001,whichiswheretheGPUsare,viacmshontheheadnode,whilecuda-dcgm
isnotyetready:
| [root@basecm11               | ~]#    | cmsh        |          |     |     |
| ---------------------------- | ------ | ----------- | -------- | --- | --- |
| [basecm11]%                  | device | use node001 |          |     |     |
| [basecm11->device[node001]]% |        | sysinfo |   | grep GPU |     |     |
Example
runningsysinfoonnode001,viacmshontheheadnode,aftercuda-dcgmisready. 4GPUsaredetected

9.1InstallingCUDA 91
| [basecm11->device[node001]]%       |         |         |     | sysinfo |       | grep GPU   |
| ---------------------------------- | ------- | ------- | --- | --------------- | ---------- |
| [maple->device[dgx-gb200-n01-c1]]% |         |         |     | sysinfo         | | grep GPU |
| Motherboard                        |         | Name    |     | GB200 1CPU:2GPU | Board PC   |
| Number                             | of GPUs |         |     | 4               |            |
| GPU[0-3]                           | name    |         |     | NVIDIA Graphics | Device     |
| GPU[0-3]                           | power   | limit   |     | 1.20KW          |            |
| GPU[0-3]                           | BIOS    |         |     | 97.00.6C.00.03  |            |
| GPU[0-3]                           | driver  | version |     | 570.82          |            |
| GPU[0-3]                           | nvlink  |         |     | 2 up            |            |
CUDAPackageInstallationGuidelinesForCompilationWithLoginNodes
• CUDAcompilationshouldtakeplaceonanodethatusesNVIDIAGPUsduringcompilation.
– UsingaworkloadmanagertoallocatethistasktoGPUnodesisrecommended.
• CrosscompilationofCUDAsoftwarewithaCPUisgenerallynotabestpracticeduetoresource
consumption,whichcanevenleadtocrashes.
– If, despite this, cross compilation with a CPU is done, then the nvidia-driver package
shouldbeinstalledonthenodeonwhichthecompilationisdone,andtheGPU-relatedser-
vicesonthenode,suchas:
nvidia-persistenced.service
*
nvidia-fabricmanager.service
*
* nvidia-dcgm.service
shouldbedisabled.
9.1.2 CUDAPackageAndModules
TheCUDApackagesrequireaccesstotheBCMrepositoriesandtothedistributionrepositories.
Thenvidia-driverpackagesreplacetheoldercuda-driverpackagesthatwereusedinversionsof
BCMpriortoversion11. Thenewerpackagesdonotcompilethedrivermodulessourceatboottime,
butduringpackageinstallation. Thenewerpackagesarealsoopensource.
Example
Forexample,onaclusterwhere(someof)thenodesaccessGPUs,buttheheadnodedoesnotaccessa
GPU,thefollowingcommandsinstalltheCUDA13.0packagesontheheadusingAPT:
root@mycluster:~# apt install cuda13.0-toolkit cuda13.0-sdk cuda13.0-visual-tools
Thenvidia-driver-,cuda-dcgm,cuda-dcgm-nvvs,andnvidia-fabricmanagerarealreadyinstalled
bydefaultonthedefaultsoftwareimage,whichisdefault-imageonanewly-installeddefaultcluster.
Carryingoutanexplicitinstallationorimageupdatefortheseisthereforenormallynotneeded.
Incaseswhereitisrequired,thenmanualinstallationintoasoftwareimageisdescribedinsection9.4
oftheAdministratorManual,whilerunningtheimageupdatecommand(section5.6oftheAdministrator
Manual),forexampleonnodes1to10,canbecarriedoutwith:
Example
| [root@mycluster      | ~]#    | cmsh        |     |                 |     |
| -------------------- | ------ | ----------- | --- | --------------- | --- |
| [mycluster]%         | device |             |     |                 |     |
| [mycluster->device]% |        | imageupdate |     | -n node0[01-10] | -w  |
If the CUDA packages have been set up on the cluster, then the end user typically just switches
betweenCUDAenvironmentswithamodulechange(section2.2oftheAdministratorManualandsec-
tion2.3oftheUserManual).
Example
| module purge | && module | load | shared | cuda13.0/toolkit |     |
| ------------ | --------- | ---- | ------ | ---------------- | --- |

92 CUDAForGPUs
| 9.2 Verifying | CUDA |     |     |     |
| ------------- | ---- | --- | --- | --- |
The cuda*-sdk packages provide CUDA SDK sources that can be used to compile libraries and tools
thatarenotpartoftheCUDAtoolkit,butusedbyCUDAsoftwaredevelopers,suchasthedeviceQuery
binary(section9.2).
AnextensivemethodtoverifythatCUDAisworkingistoruntheverify_cuda<version>.shscript,
locatedintheCUDASDKdirectory. Thevalueof<version>canbe13.0,forexample.
This script first copies the CUDA SDK source to a local directory under /tmp or /local. It then
buildsCUDAtestbinaries. Tobuildthemakefiles,thecompilationmayneedcmake,installedfromthe
cm-makepackageintotheimage(section9.4oftheAdministratorManual).
Thesebinariesclutterupthediskandarenotintendedforuseasregulartools,sotheadministrator
isurgedtoremovethemaftertheyarebuiltandrun.
A help text showing available script options is displayed when “verify_cuda<version>.sh -h” is
run.
Atypicalrunoutputisasfollows(someoutputelided):
Example
| root@node001:~# | module       | load shared | cuda13.0/toolkit |     |
| --------------- | ------------ | ----------- | ---------------- | --- |
| root@node001:~# | cd $CUDA_SDK |             |                  |     |
root@node001:/cm/shared/apps/cuda13.0/sdk/13.0.2# ./verify_cuda13.0.sh
| Copy cuda13.0 | sdk files | to "/tmp/cuda13.0" |     | directory. |
| ------------- | --------- | ------------------ | --- | ---------- |
cmake
| make (may    | take a while)         |     |          |     |
| ------------ | --------------------- | --- | -------- | --- |
| Run multiple | tests non-interactive |     | ? (y/N)? |     |
Executing: /tmp/cuda13.0/build/CMakeFiles/3.26.3/CMakeDetermineCompilerABI_CUDA.bin
80cmd: /tmp/cuda13.0/build/CMakeFiles/3.26.3/CMakeDetermineCompilerABI_CUDA.bin - rc : 0
| Executing: | /tmp/cuda13.0/build/CMakeFiles/FindOpenMP/ompver_C.bin |     |     |     |
| ---------- | ------------------------------------------------------ | --- | --- | --- |
INFO:OpenMP-date[201511]
cmd: /tmp/cuda13.0/build/CMakeFiles/FindOpenMP/ompver_C.bin - rc : 0
| Executing: | /tmp/cuda13.0/build/CMakeFiles/FindOpenMP/ompver_CXX.bin |     |     |     |
| ---------- | -------------------------------------------------------- | --- | --- | --- |
INFO:OpenMP-date[201511]
cmd: /tmp/cuda13.0/build/CMakeFiles/FindOpenMP/ompver_CXX.bin - rc : 0
| Executing: | /tmp/cuda13.0/build/Samples/0_Introduction/clock/clock |     |     |     |
| ---------- | ------------------------------------------------------ | --- | --- | --- |
...
Test passed
cmd: /tmp/cuda13.0/build/Samples/6_Performance/cudaGraphsPerfScaling/cudaGraphsPerfScaling - rc : 0
All cuda13.0 compiled test programs can be found in the "/tmp/cuda13.0/build/" directory
Alternatively the "run_tests.py" can be run in the "/tmp/cuda13.0" directory.
For example:
cd /tmp/cuda13.0; python3 run_tests.py --output ./test --dir ./build/Samples --config test_args.json
| The "/tmp/cuda13.0" | directory | may | take | up a lot of diskspace. |
| ------------------- | --------- | --- | ---- | ---------------------- |

9.2VerifyingCUDA 93
Use "rm -rf /tmp/cuda13.0" to remove the data.
OneofthebinariescompiledisthedeviceQuerycommand. Thiscanberunonanodeaccessingone
ormoreGPUs.ThedeviceQuerycommandlistsallCUDA-capableGPUsthatadevicecanaccess,along
withseveraloftheirproperties(someoutputelided). ItcanberuninCUDA13asfollows:
root@node001:/cm/shared/apps/cuda13.0/sdk/13.0.2# /tmp/cuda13.0/Samples/1_Utilities/deviceQuery/deviceQuery
/tmp/cuda13.0/Samples/1_Utilities/deviceQuery/deviceQuery Starting...
CUDA Device Query (Runtime API) version (CUDART static linking)
Detected 1 CUDA Capable device(s)
Device 0: "NVIDIA A100-PCIE-40GB"
CUDA Driver Version / Runtime Version 13.0 / 13.0
CUDA Capability Major/Minor version number: 8.0
Total amount of global memory: 40441 MBytes (42405855232 bytes)
(108) Multiprocessors, (064) CUDA Cores/MP: 6912 CUDA Cores
GPU Max Clock rate: 1410 MHz (1.41 GHz)
Memory Clock rate: 1215 Mhz
Memory Bus Width: 5120-bit
L2 Cache Size: 41943040 bytes
Maximum Texture Dimension Size (x,y,z) 1D=(131072), 2D=(131072, 65536), 3D=(16384, 16384, 16384)
Maximum Layered 1D Texture Size, (num) layers 1D=(32768), 2048 layers
Maximum Layered 2D Texture Size, (num) layers 2D=(32768, 32768), 2048 layers
Total amount of constant memory: 65536 bytes
Total amount of shared memory per block: 49152 bytes
Total shared memory per multiprocessor: 167936 bytes
Total number of registers available per block: 65536
Warp size: 32
Maximum number of threads per multiprocessor: 2048
Maximum number of threads per block: 1024
Max dimension size of a thread block (x,y,z): (1024, 1024, 64)
Max dimension size of a grid size (x,y,z): (2147483647, 65535, 65535)
Maximum memory pitch: 2147483647 bytes
Texture alignment: 512 bytes
Concurrent copy and kernel execution: Yes with 3 copy engine(s)
Run time limit on kernels: No
Integrated GPU sharing Host Memory: No
Support host page-locked memory mapping: Yes
Alignment requirement for Surfaces: Yes
Device has ECC support: Enabled
Device supports Unified Addressing (UVA): Yes
Device supports Managed Memory: Yes
Device supports Compute Preemption: Yes
Supports Cooperative Kernel Launch: Yes
Device PCI Domain ID / Bus ID / location ID: 0 / 0 / 6
Compute Mode:
< Default (multiple host threads can use ::cudaSetDevice() with device simultaneously) >
deviceQuery, CUDA Driver = CUDART, CUDA Driver Version = 13.0, CUDA Runtime Version = 13.0, NumDevs = 1
Result = PASS
root@node001:/cm/shared/apps/cuda13.0/sdk/13.0.2#
Thequerycandetectifthereismorethan1GPU,anddisplayoutputforeachGPUthatitfinds.
TheCUDAprogrammingguide(https://docs.nvidia.com/cuda/cuda-programming-guide/)has
furtherinformationonhowtoruncomputejobsusingCUDA.

94 CUDAForGPUs
FurtherInformationOnCUDAVerification
MoreonverificationcanbefoundintheNVIDIACUDAINSTALLATIONGUIDEFORLINUXathttps:
//docs.nvidia.com/cuda/pdf/CUDA_Installation_Guide_Linux.pdf.
9.3 Verifying OpenCL
CUDA12.8containsanOpenCLcompatibleinterface. ToverifythatOpenCLisworking,orfailing,the
binariescanbecompiledfromtheprovidedOpenCLsourceandrun. Forexample:
Example
root@node001:~# module load shared cuda12.8/toolkit
root@node001 ~# cd $CUDA_SDK
root@node001:/cm/shared/apps/cuda12.8/sdk/12.8.1# cd opencl/OpenCL/ ; ls
bin common doc Makefile releaseNotesData Samples.html src
root@node001:/cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/OpenCL# make
a - obj/release/oclUtils.cpp.o
’ ’
make[1]: Leaving directory /cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/OpenCL/common
’ ’
make[1]: Entering directory /cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/shared
‘ ’ ‘ ’ ‘ ’
ar: u modifier ignored since D is the default (see U )
r - obj/x86_64/release/shrUtils.cpp.o
r - obj/x86_64/release/rendercheckGL.cpp.o
r - obj/x86_64/release/cmd_arg_reader.cpp.o
’ ’
make[1]: Leaving directory /cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/shared
’ ’
make[1]: Entering directory /cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/OpenCL/src/oclBandwidthTest
’ ’
make[1]: Leaving directory /cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/OpenCL/src/oclBandwidthTest
...
ThebinariesmadeusingtheMakefilecanthenberunfromtheirdirectory:
root@node001:/cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/OpenCL# cd bin/linux/release/
root@node001:/cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/OpenCL/bin/linux/release# ls
oclBandwidthTest
oclBandwidthTest.txt
oclBlackScholes
oclConvolutionSeparable
oclCopyComputeOverlap
oclDCT8x8
oclDeviceQuery
oclDotProduct
oclDXTCompression
oclFDTD3d
oclHiddenMarkovModel
oclHistogram
oclInlinePTX
oclMatrixMul
oclMatVecMul
oclMersenneTwister
oclMultiThreads
oclQuasirandomGenerator
oclRadixSort
oclReduction
oclScan
oclSimpleMultiGPU
oclSortingNetworks
oclTranspose

| 9.4NVIDIAValidationSuite(Package: |     |     | cuda-dcgm-nvvs) |     | 95  |
| --------------------------------- | --- | --- | --------------- | --- | --- |
oclTridiagonal
oclVectorAdd
root@node001:/cm/shared/apps/cuda12.8/sdk/12.8.1/opencl/OpenCL/bin/linux/release# for i in ocl*; do ./$i ; done
| [oclBandwidthTest] | starting... |     |     |     |     |
| ------------------ | ----------- | --- | --- | --- | --- |
| ./oclBandwidthTest | Starting... |     |     |     |     |
Running on...
Tesla V100-SXM3-32GB
Quick Mode
| Host to Device     | Bandwidth,        | 1          | Device(s), Paged | memory, direct access |     |
| ------------------ | ----------------- | ---------- | ---------------- | --------------------- | --- |
| Transfer           | Size (Bytes)      |            | Bandwidth(MB/s)  |                       |     |
| 33554432           |                   |            | 5528.1           |                       |     |
| Device to          | Host Bandwidth,   | 1          | Device(s), Paged | memory, direct access |     |
| Transfer           | Size (Bytes)      |            | Bandwidth(MB/s)  |                       |     |
| 33554432           |                   |            | 3915.9           |                       |     |
| Device to          | Device Bandwidth, |            | 1 Device(s)      |                       |     |
| Transfer           | Size (Bytes)      |            | Bandwidth(MB/s)  |                       |     |
| 33554432           |                   |            | 724307.1         |                       |     |
| [oclBandwidthTest] | test              | results... |                  |                       |     |
PASSED
| > exiting   | in 3 seconds:                                  | 3...2...1...done! |                 |                 |     |
| ----------- | ---------------------------------------------- | ----------------- | --------------- | --------------- | --- |
| ...Andsoon. | Theotherbinarieslistedshouldalsorunandpass.... |                   |                 |                 |     |
| 9.4 NVIDIA  | Validation                                     |                   | Suite (Package: | cuda-dcgm-nvvs) |     |
The NVIDIA Validation Suite (NVVS) runs diagnostics to validate the NVIDIA software components.
Runningthenvvsbinarydirectlyisdeprecated. ThediagnosticsforCUDA12.8areruninsteadaspart
| ofthedcgmi | diagcommand. |     |     |     |     |
| ---------- | ------------ | --- | --- | --- | --- |
ThepackageforNVVSisnotinstalledbydefault. ItisalsonotavailableforRHEL8andderivatives.
Ifthepackageisnotinstalled,thenanattempttorunthedcgmiutilityfails:
Example
| [root@basecm11 | ~] module | load | cuda-dcgm |     |     |
| -------------- | --------- | ---- | --------- | --- | --- |
| [root@basecm11 | ~]# dcgmi | diag | -r 1      |     |     |
Error: Diagnostic could not be run because the Tesla recommended driver is not being used.
Thepackagecanbeinstalledwith:
Example
| [root@basecm11 | ~] module | load    | cuda-dcgm      |     |     |
| -------------- | --------- | ------- | -------------- | --- | --- |
| [root@basecm11 | ~] yum    | install | cuda-dcgm-nvvs |     |     |
Afteritisinstalled,thenodeonwhichtheinstallationisdonemustberebooted.
Runningthediagnosticaftertherebootshoulddisplayoutputsimilarto:
Example

| 96             |                |                |     | CUDAForGPUs |
| -------------- | -------------- | -------------- | --- | ----------- |
| [root@basecm11 | ~] module      | load cuda-dcgm |     |             |
| [root@basecm11 | ~]# dcgmi      | diag -r 3      |     |             |
| Successfully   | ran diagnostic | for group.     |     |             |
+---------------------------+------------------------------------------------+
| | Diagnostic |     | | Result |     | |   |
| ------------ | --- | -------- | --- | --- |
+===========================+================================================+
|----- Metadata ----------+------------------------------------------------|
| | DCGM Version |                  | | 4.1.1       |            | |   |
| -------------- | ---------------- | ------------- | ---------- | --- |
| | Driver       | Version Detected | | 570.82      |            | |   |
| | GPU Device   | IDs Detected     | | 2941, 2941, | 2941, 2941 | |   |
| | Number       | of CPUs Detected | | 2           |            | |   |
|----- Deployment --------+------------------------------------------------|
| | software |     | | Pass       |     | |   |
| ---------- | --- | ------------ | --- | --- |
| |          |     | | GPU0: Pass |     | |   |
| |          |     | | GPU1: Pass |     | |   |
| |          |     | | GPU2: Pass |     | |   |
| |          |     | | GPU3: Pass |     | |   |
+----- Hardware ----------+------------------------------------------------+
| | memory      |     | | Skip       |     | |   |
| ------------- | --- | ------------ | --- | --- |
| |             |     | | GPU0: Skip |     | |   |
| |             |     | | GPU1: Skip |     | |   |
| |             |     | | GPU2: Skip |     | |   |
| |             |     | | GPU3: Skip |     | |   |
| | diagnostic  |     | | Skip       |     | |   |
| |             |     | | GPU0: Skip |     | |   |
| |             |     | | GPU1: Skip |     | |   |
| |             |     | | GPU2: Skip |     | |   |
| |             |     | | GPU3: Skip |     | |   |
| | nvbandwidth |     | | Skip       |     | |   |
| |             |     | | GPU0: Skip |     | |   |
| |             |     | | GPU1: Skip |     | |   |
| |             |     | | GPU2: Skip |     | |   |
| |             |     | | GPU3: Skip |     | |   |
+----- Integration -------+------------------------------------------------+
| | pcie |     | | Skip       |     | |   |
| ------ | --- | ------------ | --- | --- |
| |      |     | | GPU0: Skip |     | |   |
| |      |     | | GPU1: Skip |     | |   |
| |      |     | | GPU2: Skip |     | |   |
| |      |     | | GPU3: Skip |     | |   |
+----- Stress ------------+------------------------------------------------+
| | memory_bandwidth |     | | Skip       |     | |   |
| ------------------ | --- | ------------ | --- | --- |
| |                  |     | | GPU0: Skip |     | |   |
| |                  |     | | GPU1: Skip |     | |   |
| |                  |     | | GPU2: Skip |     | |   |
| |                  |     | | GPU3: Skip |     | |   |
| | targeted_stress  |     | | Skip       |     | |   |
| |                  |     | | GPU0: Skip |     | |   |
| |                  |     | | GPU1: Skip |     | |   |
| |                  |     | | GPU2: Skip |     | |   |
| |                  |     | | GPU3: Skip |     | |   |
| | targeted_power   |     | | Skip       |     | |   |
| |                  |     | | GPU0: Skip |     | |   |
| |                  |     | | GPU1: Skip |     | |   |
| |                  |     | | GPU2: Skip |     | |   |
| |                  |     | | GPU3: Skip |     | |   |

9.5FurtherNVIDIAConfigurationViaTheClusterManager 97
+---------------------------+------------------------------------------------+
9.5 Further NVIDIA Configuration Via The Cluster Manager
After theinstallation andverification hasbeen carriedout for CUDAdrivers, furtherconfiguration as
partofCMDaemonmanagementcanbecarriedout, asexplainedinsection3.16.2oftheAdministrator
Manual.

10
OFED Software Stack
This section explains how OFED (OpenFabrics Enterprise Distribution) packages are installed so that
BCMcanuseInfiniBandfordatatransferduringregularuse—thatisforcomputationruns,ratherthan
for booting up or provisioning. The configuration of PXE booting over InfiniBand is described in sec-
tion 5.1.3 of the Administrator Manual. The configuration of node provisioning over InfiniBand is de-
scribedinsection5.3.3oftheAdministratorManual.
10.1 Choosing A Distribution Version, Or A Non-distribution Version,
Ensuring The Kernel Matches, And Logging The Installation
By default, the Linux distribution OFED stack is matched to the kernel version and installed on the
cluster. Thisisthesafestoptioninmostcases,andalsoallowsNFSoverRDMA.
BCM also allows NVIDIA’s Mellanox OFED (sometimes called MOFED) software to be installed.
Such separate, non-distribution OFED stacks can be more recent than the distribution version, which
meansthattheycanprovidesupportformorerecenthardwareandfirmware,aswellasmorefeatures.
For recent OFED stacks to work, the OFED firmware as provided by the manufacturer should in
generalalsoberecent,toensuresoftwaredrivercompatibility.
If NVIDIA AI Enterprise is to be used, then a matching, supported, version of OFED must be se-
lected. A matching, supported OFED version can be found by contacting support via the BCM sub-
scriptionattheNVIDIAEnterpriseSupportpageat:
https://www.nvidia.com/en-us/support/enterprise/
Since June 2025, BCM no longer supports the non-distribution legacy BCM-packaged Mellanox
OFED stack. These were packages that were provided from the BCM repository, with names such as
mlnx-ofed58,mlnx-ofed59-dgx-h100,mlnx-ofed59,mlnx-ofed23.04,andmlnx-ofed24.07.
BCM has moved on to installing the non-distribution NVIDIA DOCA OFED stack directly (sec-
tion10.2),withthehelpofaninstallationscript. TheupstreamNVIDIADOCAOFEDstackisasubset
ofthefullDOCAsoftwarestack.
If there is no DOCA OFED stack available for the kernel in use, then falling back to a supported
kernelisrecommended.
Whenupdatingkernelsontheheadortheregularnodes,theupdatedNVIDIADOCAOFEDsoft-
warestackmustbereinstalled.
10.2 DOCA OFED Stack Installation Using The BCM DOCA OFED Installation
Script
TheDOCAversionsavailableatthetimeofwriting,April2026,are: 2.9.3,3.2.1
ForDOCAOFEDdrivers,installationcanbecarriedoutforBCMwiththesemethods:
• duringtheinitialclusterinstallation(figure3.23)

100 OFEDSoftwareStack
• on a running cluster by running the BCM DOCA installation script, which comes with the BCM
cluster-toolspackage. Thismethodiscoveredinthissection.
• onarunningclusterbycreatingannewimagefornodesusingthecm-create-imageorcm-image
toolswiththe--extra-pkg-groupoption. Thismethodiscoveredinpage542oftheAdministrator
Manual.
Theinstallationscriptislocatedat:
root@basecm11:~# /cm/local/apps/cluster-tools/bin/cm-doca-ofed-install.sh
Runningthescriptwithoutanyargumentsshowsausagehelptext.
Thefollowingargumentsmustbespecified:
• -v|--version: This chooses which DOCA version is to be used. At the time of writing of this
section(April2026)theseare:
– 2.9.3
– 3.2.1
• -hor-s: theseselectiftheDOCAinstallationiscarriedoutontheheadorsoftwareimage
Example
/cm/local/apps/cluster-tools/bin/cm-doca-ofed-install.sh -v 3.2.1 -h
Theinstallationlogisrecordedin:
/var/log/cm-doca-ofed.log
whiletheversioninstalledisrecordedin
/etc/cm-ofed

11
Burning Nodes
TheburnframeworkisacomponentofNVIDIABaseCommandManager11thatcanautomaticallyrun
test scripts on specified nodes within a cluster. The framework is designed to stress test newly built
machines and to detect components that may fail under load. Nodes undergoing a burn session with
thedefaultburnconfiguration,losetheirfilesystemandpartitiondataforallattacheddrives,andrevert
totheirsoftwareimageonprovisioningafterareboot.
11.1 Test Scripts Deployment
Theframeworkrequirespowermanagementtoberunningandworkingproperlysothatthenodecan
be power cycled by the scripts used. In modern clusters power management is typically achieved by
enablingabaseboardmanagementcontrollersuchasIPMI,iLO,orRedfish. Detailsonpowermanage-
mentaregiveninChapter4oftheAdministratorManual.
The framework can run any executable script. The default test scripts are mostly bash
shell scripts and Perl scripts. Each test script has a directory in /cm/shared/apps/cmburn con-
taining the script. The directory and test script must have the same name. For example:
/cm/shared/apps/cmburn/disktest/disktest is the default script used for testing a disk. More on
thecontentsofatestscriptisgiveninsection11.3.2.
11.2 Burn Configurations
11.2.1 BurnConfigurationSimpleXMLExample
AburnconfigurationisanXMLfilestoredintheCMDaemondatabasethatspecifiestheburntestsandthe
orderinwhichtheyrun. Withintheburnconfigurationthetestsarenormallygroupedintosequences,
and several sequences typically make up a phase. Phases in turn are grouped in either a pre-install
sectionorpost-installsection. Asimpleexampleofsuchaburnconfigurationcouldthereforelooklike:
Example
<?xml version="1.0"?>
<burnconfig>
<mail>
<address>root@master</address>
<address>some@other.address</address>
</mail>
<pre-install>
<phase name="01-hwinfo">
<test name="hwinfo"/>

102 BurningNodes
<test name="hwdiff"/>
<test name="sleep" args="10"/>
</phase>
<phase name="02-disks">
<test name="disktest" args="30"/>
<test name="mce_check" endless="1"/>
</phase>
</pre-install>
<post-install>
<phase name="03-hpl">
<test name="hpl"/>
<test name="mce_check" endless="1"/>
</phase>
<phase name="04-compile">
<test name="compile" args="6"/>
<test name="mce_check" endless="1"/>
</phase>
</post-install>
</burnconfig>
MailTag
The optional <mail> tag pair can add a sequence of e-mail addresses, with each address enclosed in
an<address>tagpair. Theseaddressesreceiveburnfailureandwarningmessages,aswellasanotice
whentheburnrunhascompleted.
Pre-installAndPost-install
Thepre-installpartofaburnconfigurationisconfiguredwiththe<pre-install>tagpair,andrunfrom
insideanode-installerenvironment. ThisenvironmentisalimitedLinuxenvironmentandallowssome
simplerteststorunbeforeloadingupthefullLinuxnodeenvironment.
Similarly,thepost-installpartofaburnconfigurationusesthe<post-install>tagpairtorunfrom
insidethefullLinuxnodeenvironment. Thisenvironmentallowsmorecomplexteststorun.
Post-burnInstallMode
The optional <post-burn-install> tag pair allows the administrator to specify the install mode (sec-
tion 5.4.4 of the Administrator Manual) after burn. The tag pair can enclose a setting of AUTO, FULL,
MAIN,orNOSYNC.Thedefaultsettingistheinstallmodethatwassetbeforeburnstarted.
Phases
Thephasessectionsmustexist.Ifthereisnocontentforthephases,thephasestagsmuststillbeinplace
(“mustexist”). Eachphasemusthaveauniquenameandmustbewrittenintheburnconfigurationfile
inalphanumericalorder.Bydefault,numbersareusedasprefixes.Thephasesareexecutedinsequence.
Tests
Eachphaseconsistsofoneormoretesttags.Thetestscanoptionallybepassedargumentsusingtheargs
propertyoftheburnconfigurationfile(section11.2). Ifmultipleargumentsarerequired,theyshouldbe
aspaceseparatedlist,withthe(single)listbeingtheargsproperty.
Testsinthesamephasearerunsimultaneously.

11.3RunningABurnConfiguration 103
Mostteststestsomethingandthenend. Forexample,thedisktestteststheperformanceofalldrives
andthenquits.
Testswhicharedesignedtoendautomaticallyareknownasnon-endlesstests.
Testsdesignedtomonitorcontinuouslyareknownasendlesstests.Endlesstestsarenotreallyendless.
Theyendonceallthenon-endlesstestsinthesamephaseareended,thusbringinganendtothephase.
Endlessteststypicallytestforerrorscausedbytheloadinducedbythenon-endlesstests. Forexample
themce_checktestcontinuouslykeepsaneyeoutforMachineCheckExceptionswhilethenon-endless
testsinthesamephasearerun.
Aspecialtestisthefinaltest,memtest86,whichispartofthedefaultburnrun,asconfiguredinthe
XML configuration default-destructive. It does run endlessly if left to run. To end it, the adminis-
tratorcandealwithitsoutputatthenodeconsoleorcanpowerresetthenode. Itisusuallyconvenient
toremovememtest86fromthedefaultXMLconfigurationinlargerclusters,andtorelyontheHPLand
memtestertestsinstead,foruncoveringmemoryhardwareerrors.
11.2.2 BurnConfigurationXMLSchemaDefinition
InBCM,burnconfigurationsetupssuchasinsection11.2.1havetheirglobalstructuredefinedusingan
XMLschemadefinition,whichisinstalledontheheadnodein/cm/local/apps/cmd/etc/htdocs/xsd/
burnconfig.xsd.
TheXMLschemadefinitioncanalsobeviewedwith:
Example
| [root@basecm11 | ]#  | cmsh -c "main        | xsdschema | burnconfig" | | less |
| -------------- | --- | -------------------- | --------- | ----------- | ------ |
| 11.3 Running   |     | A Burn Configuration |           |             |        |
Burnconfigurationscanbeviewedandexecutedfromcmsh.
11.3.1 BurnConfigurationAndExecutionIncmsh
BurnConfigurationFileSettings
Fromcmsh,theburnconfigurationscanbeaccessedfrompartitionmodeasfollows:
Example
| [basecm11]%                               | partition | use base                 |            |               |        |
| ----------------------------------------- | --------- | ------------------------ | ---------- | ------------- | ------ |
| [basecm11->partition[base]]%              |           | burnconfigs              |            |               |        |
| [basecm11->partition[base]->burnconfigs]% |           |                          |            | list          |        |
| Name (key)                                |           | Description              |            | XML           |        |
| -------------------                       |           | ------------------------ |            | ------------- |        |
| default-destructive                       |           | Standard                 | burn test. | <2614         | bytes> |
| long-hpl                                  |           | Run HPL test             | for        | a long+ <829  | bytes> |
Thevaluesofaparticularburnconfiguration(default-destructiveinthefollowingexample)can
beviewedasfollows:
Example
| [basecm11->partition[base]->burnconfigs]% |     |     |     | use default-destructive |     |
| ----------------------------------------- | --- | --- | --- | ----------------------- | --- |
[basecm11->partition[base]->burnconfigs[default-destructive]]% show
| Parameter |     | Value |     |     |     |
| --------- | --- | ----- | --- | --- | --- |
---------------------- --------------------------------------------------------
Description Standard destructive burn test. Beware, wipes the disks!
| Name |     | default-destructive |     |     |     |
| ---- | --- | ------------------- | --- | --- | --- |
Revision
| XML |     | <2614 bytes> |     |     |     |
| --- | --- | ------------ | --- | --- | --- |

104 BurningNodes
The set command can be used to modify existing values of the burn configuration, that is:
Description, Name, and XML. XML is the burn configuration file itself. The get xml command can be
used to view the file, while using set xml opens up the default text editor, thus allowing the burn
configurationtobemodified.
A new burn configuration can also be added with the add command. The new burn configuration
canbecreatedfromscratchwiththesetcommand. However,anXMLfilecanalsobeimportedtothe
newburnconfigurationbyspecifyingthefullpathoftheXMLfiletobeimported:
Example
| [basecm11->partition[base]->burnconfigs]% |     |     | add | boxburn |     |
| ----------------------------------------- | --- | --- | --- | ------- | --- |
[basecm11->partition[base]->burnconfigs*[boxburn*]]% set xml /tmp/im.xml
The burn configuration can also be edited when carrying out burn execution with the burn com-
mand.
ExecutingABurn
Aburnasspecifiedbytheburnconfigurationfilecanbeexecutedincmshusingtheburncommandof
devicemode.
Burn commands: The burn commands can modify these properties, as well as execute other burn-
relatedoperations.
Theburncommandsareexecutedwithindevicemode,andare:
| • burn | start  |     |     |     |     |
| ------ | ------ | --- | --- | --- | --- |
| • burn | stop   |     |     |     |     |
| • burn | status |     |     |     |     |
| • burn | log    |     |     |     |     |
Theburnhelptextthatfollowsliststhedetailedoptions. Next,operationswiththeburncommands
illustratehowtheoptionsmaybeusedalongwithsomefeatures.
| [head1->device[node005]]% |                | burn        |                                           |     |     |
| ------------------------- | -------------- | ----------- | ----------------------------------------- | --- | --- |
| Name: burn                | - Node burn    | control     |                                           |     |     |
| Usage: burn               | [OPTIONS]      | status      |                                           |     |     |
| burn                      | [OPTIONS]      | start       |                                           |     |     |
| burn                      | [OPTIONS]      | stop        |                                           |     |     |
| burn                      | [OPTIONS]      | log         |                                           |     |     |
| Options: -n,              | --nodes <node> |             |                                           |     |     |
|                           | List of        | nodes, e.g. | node001..node015,node020..node028,node030 |     |     |
or ^/some/file/containing/hostnames
-g, --group <group>
Include all nodes that belong to the node group, e.g. testnodes or test01,test03
| -c, | --category | <category> |     |     |     |
| --- | ---------- | ---------- | --- | --- | --- |
Include all nodes that belong to the category, e.g. default or default,gpu
-r, --rack <rack>
|     | Include | all nodes that | are located | in the given | rack, e.g rack01 |
| --- | ------- | -------------- | ----------- | ------------ | ---------------- |
or rack01..rack04

11.3RunningABurnConfiguration 105
| -h, --chassis | <chassis> |     |     |     |     |     |     |     |
| ------------- | --------- | --- | --- | --- | --- | --- | --- | --- |
Include all nodes that are located in the given chassis, e.g chassis01
or chassis03..chassis05
| -e, --overlay | <overlay> |      |     |      |              |          |              |     |
| ------------- | --------- | ---- | --- | ---- | ------------ | -------- | ------------ | --- |
| Include       | all nodes | that | are | part | of the given | overlay, | e.g overlay1 |     |
or overlayA,overlayC
-m, --image <image>
| Include | all nodes | that | have | the | given image, | e.g | default-image | or  |
| ------- | --------- | ---- | ---- | --- | ------------ | --- | ------------- | --- |
default-image,gpu-image
-t, --type <type>
| Type of | devices, | e.g | node | or virtualnode,cloudnode |     |     |     |     |
| ------- | -------- | --- | ---- | ------------------------ | --- | --- | --- | --- |
-i, --intersection
| Calculate | the | intersection |     | of the | above | selections |     |     |
| --------- | --- | ------------ | --- | ------ | ----- | ---------- | --- | --- |
-u, --union
| Calculate | the | union | of the | above | selections |     |     |     |
| --------- | --- | ----- | ------ | ----- | ---------- | --- | --- | --- |
-l, --role role
| Filter | all nodes | that | have | the | given role |     |     |     |
| ------ | --------- | ---- | ---- | --- | ---------- | --- | --- | --- |
-s, --status <status>
Only run command on nodes with specified status, e.g. UP, "CLOSED|DOWN",
"INST.*"
--config <name>
Burn with the specified burn configuration. See in partition burn configurations
| for a list | of  | valid | names |     |     |     |     |     |
| ---------- | --- | ----- | ----- | --- | --- | --- | --- | --- |
--file <path>
| Burn with | the | specified | file | instead | of  | burn configuration |     |     |
| --------- | --- | --------- | ---- | ------- | --- | ------------------ | --- | --- |
--later
| Do not | reboot | nodes | now, | wait until | manual | reboot |     |     |
| ------ | ------ | ----- | ---- | ---------- | ------ | ------ | --- | --- |
--edit
| Open editor | for | last | minute | changes |     |     |     |     |
| ----------- | --- | ---- | ------ | ------- | --- | --- | --- | --- |
--no-drain
| Do not | drain | the node | from | WLM | before starting |     | to burn |     |
| ------ | ----- | -------- | ---- | --- | --------------- | --- | ------- | --- |
--no-undrain
| Do not | undrain | the | node from | WLM | after burn | is  | complete |     |
| ------ | ------- | --- | --------- | --- | ---------- | --- | -------- | --- |
-p, --path
| Show path | to  | the burn | log | files. | Of the | form: | /var/spool/burn/<mac>. |     |
| --------- | --- | -------- | --- | ------ | ------ | ----- | ---------------------- | --- |
-v, --verbose
| Show verbose |     | output | (only | for burn | status) |     |     |     |
| ------------ | --- | ------ | ----- | -------- | ------- | --- | --- | --- |
--sort <field1>[,<field2>,...]

106 BurningNodes
| Override        |           | default  | sort      | order | (only for | burn status) |
| --------------- | --------- | -------- | --------- | ----- | --------- | ------------ |
| -d, --delimiter |           | <string> |           |       |           |              |
| Set             | default   | row      | separator | (only | for       | burn status) |
| -d, --delay     | <seconds> |          |           |       |           |              |
Wait <seconds> between executing two sequential power commands. This option is
| ignored |     | for the | status | command |     |     |
| ------- | --- | ------- | ------ | ------- | --- | --- |
Examples:
| burn --config |     | default-destructive |     |     | start -n | node001 |
| ------------- | --- | ------------------- | --- | --- | -------- | ------- |
Burncommandoperations: Burncommandsallowthefollowingoperations,andhavethefollowing
features:
• start,stop,status,log:Thebasicburnoperationsallowaburntobestartedorstopped,andthe
statusofaburntobeviewedandlogged.
– The “burn start” command always needs a configuration file name. In the following it is
boxburn. Thecommandalsoalwaysneedstobegiventhenodesitoperateson:
| [basecm11->device]% |       |     | burn --config |     | boxburn | -n node007 start |
| ------------------- | ----- | --- | ------------- | --- | ------- | ---------------- |
| Power reset         | nodes |     |               |     |         |                  |
[basecm11->device]%
| ipmi0 .................... |       |          |           | [ RESET | ] node007 |          |
| -------------------------- | ----- | -------- | --------- | ------- | --------- | -------- |
| Fri Nov                    | 3 ... | [notice] | basecm11: |         | node007   | [ DOWN ] |
[basecm11->device]%
Fri Nov 3 ... [notice] basecm11: node007 [ INSTALLING ] (node installer started)
[basecm11->device]%
Fri Nov 3 ... [notice] basecm11: node007 [ INSTALLING ] (running burn in tests)
...
– The“burn stop”commandonlyneedstobegiventhenodesitoperateson,forexample:
| [basecm11->device]% |                 |     | burn -n | node007 | stop |     |
| ------------------- | --------------- | --- | ------- | ------- | ---- | --- |
| – The“burn          | status”command: |     |         |         |      |     |
* maybegiventhenodesforwhichthestatusistobefound,forexample:

| 11.3RunningABurnConfiguration |     |                     |             |        |                     |          |              | 107 |
| ----------------------------- | --- | ------------------- | ----------- | ------ | ------------------- | -------- | ------------ | --- |
|                               |     | [basecm11->device]% | burn        | status | -n node005..node007 |          |              |     |
|                               |     | Hostname Burn       | name Status |        |                     | New burn | on PXE Phase | ... |
-------- --------- ------------------------- --------------- -------- ...
|     |     | node005         | no        | burn results | available | no  |          | ... |
| --- | --- | --------------- | --------- | ------------ | --------- | --- | -------- | --- |
|     |     | node006         | currently | not          | burning   | no  |          | ... |
|     |     | node007 boxburn | Burning   |              |           | yes | 02-disks | ... |
eachlineofoutputisquitelong,soeachlinehasbeenrenderedtruncatedandellipsized.
Theellipsismarksinthe5precedingoutputlinesalignwiththelinesthatfollow.
Thatis,thelinesthatfollowaretheendingsofthepreceding5lines:
|     |     | ...Warnings | Tests |     |     |     |     |     |
| --- | --- | ----------- | ----- | --- | --- | --- | --- | --- |
...--------- --------------------------------------------------------------
...0
...0
...0 /var/spool/burn/c8-1f-66-f2-61-c0/02-disks/disktest (S,171),\
|     |     |     | /var/spool/burn/c8-1f-66-f2-61-c0/02-disks/kmon |     |     |     | (S),\ |     |
| --- | --- | --- | ----------------------------------------------- | --- | --- | --- | ----- | --- |
/var/spool/bu+
– The “burn log” command displays the burn log for specified node groupings. Each node
withabootMACaddressof<mac>hasanassociatedburnlogfile.
• Advancedoptionsincludethefollowing:
– -n|--nodes, -g|--group, -c|--category, -r|--rack, -h|--chassis, -e|--overlay,
-t|--type,-i|--intersection,-u|--union,-r|--role,-s|--status: Theseoptionsallow
burncommandstobeexecutedovervariousnodegroupings.
– --config <burn configuration>, --file <path>: The burn configuration file can be set as one
oftheXMLburnconfigurationslistedinpartitionmode,oritcanbesetasthepathofthe
XMLfilefromthefilesystem
– -l|--later:Thisoptiondisablestheimmediatepowerresetthatoccursonrunningthe“burn
start”or“burn stop”commandonanode. Thisallowstheadministratortopowerdown
manually,whenpreferred.
– -e|--edit:Theburnconfigurationfilecanbeeditedwiththe-eoptionforthe“burn start”
command. Thisisanalternativetoeditingtheburnconfigurationfileinpartitionmode.
– --no-drain,--no-undrain: Thenodeisnotdrainedbeforeburning,ornotundrainedafter
burning
-p|--path:
– Thisshowstheburnlogpath,bydefault(section11.4)ontheheadnodeundera
directorynamedafterthemacaddress/var/spool/burn/<mac>.
Example
|     | [basecm11->device]% |                                   | burn -p | -n node001..node003 |     | log |     |     |
| --- | ------------------- | --------------------------------- | ------- | ------------------- | --- | --- | --- | --- |
|     | node001:            | /var/spool/burn/fa-16-3e-60-1d-c7 |         |                     |     |     |     |     |
|     | node002:            | /var/spool/burn/fa-16-3e-8a-d8-0e |         |                     |     |     |     |     |
|     | node003:            | /var/spool/burn/fa-16-3e-af-38-cd |         |                     |     |     |     |     |
Burn command output examples: The burn status command has a compact one-line output per
node:
Example
| [basecm11->device]% |     | burn -n | node001 status |     |     |     |     |     |
| ------------------- | --- | ------- | -------------- | --- | --- | --- | --- | --- |
node001 (00000000a000) - W(0) phase 02-disks 00:02:58 (D:H:M) FAILED, mce_check (SP),\
| disktest | (SF,61), | kmon (SP) |     |     |     |     |     |     |
| -------- | -------- | --------- | --- | --- | --- | --- | --- | --- |

108 BurningNodes
Thefieldsintheprecedingoutputexampleare:
| Description              |     | Value          |     |     | MeaningHere |     |
| ------------------------ | --- | -------------- | --- | --- | ----------- | --- |
| Thenodename              |     | node001        |     |     |             |     |
| Thenodetag               |     | (00000000a000) |     |     |             |     |
| Warningssincestartofburn |     | (0)            |     |     |             |     |
02-disks
| Thecurrentphasename |     |     |     |     | Burnconfigurationphasebeing |     |
| ------------------- | --- | --- | --- | --- | --------------------------- | --- |
runis02-disks
| Timesincephasestarted |     | 00:02:58  |     | (D:H:M) | 2hours58minutes  |     |
| --------------------- | --- | --------- | --- | ------- | ---------------- | --- |
| Stateofcurrentphase   |     | FAILED    |     |         | Failedin02-disks |     |
| burntestforMCE        |     | mce_check |     | (SP)    | StartedandPassed |     |
| burntestfordisks      |     | disktest  |     | (SF,61) | StartedandFailed |     |
61isthespeed,andiscustom
information
| burntestkernellogmonitor |     | kmon | (SP) |     | StartedandPassed |     |
| ------------------------ | --- | ---- | ---- | --- | ---------------- | --- |
Eachtestinaphaseusestheseletterstodisplayitsstatus:
| Letter | Meaning |     |     |     |     |     |
| ------ | ------- | --- | --- | --- | --- | --- |
| S      | started |     |     |     |     |     |
| W      | warning |     |     |     |     |     |
| F      | failed  |     |     |     |     |     |
| P      | passed  |     |     |     |     |     |
The“burn log”commandoutputlookslikethefollowing(someoutputelided):
| [basecm11->device]% | burn -n                 | node001 | log  |           |              |     |
| ------------------- | ----------------------- | ------- | ---- | --------- | ------------ | --- |
| Thu ... 2012:       | node001 - burn-control: |         | burn | framework | initializing |     |
Thu ... 2012: node001 - burn-control: e-mail will be sent to: root@master
| Thu ... 2012: | node001 - burn-control: |     | finding  | next | pre-install     | phase |
| ------------- | ----------------------- | --- | -------- | ---- | --------------- | ----- |
| Thu ... 2012: | node001 - burn-control: |     | starting |      | phase 01-hwinfo |       |
Thu ... 2012: node001 - burn-control: starting test /cm/shared/apps/cmburn/hwinfo
Thu ... 2012: node001 - burn-control: starting test /cm/shared/apps/cmburn/sleep
| Thu ... 2012: | node001 - sleep:  | sleeping | for       | 10          | seconds        |     |
| ------------- | ----------------- | -------- | --------- | ----------- | -------------- | --- |
| Thu ... 2012: | node001 - hwinfo: | hardware |           | information |                |     |
| Thu ... 2012: | node001 - hwinfo: | CPU1:    | vendor_id |             | = AuthenticAMD |     |
...
Thu ... 2012: node001 - burn-control: test hwinfo has ended, test passed
Thu ... 2012: node001 - burn-control: test sleep has ended, test passed
Thu ... 2012: node001 - burn-control: all non-endless test are done, terminating endless tests
| Thu ... 2012: | node001 - burn-control: |     | phase   | 01-hwinfo | passed      |       |
| ------------- | ----------------------- | --- | ------- | --------- | ----------- | ----- |
| Thu ... 2012: | node001 - burn-control: |     | finding | next      | pre-install | phase |

11.3RunningABurnConfiguration 109
| Thu ... 2012: | node001 - burn-control: |     | starting | phase | 02-disks |     |
| ------------- | ----------------------- | --- | -------- | ----- | -------- | --- |
Thu ... 2012: node001 - burn-control: starting test /cm/shared/apps/cmburn/disktest
Thu ... 2012: node001 - burn-control: starting test /cm/shared/apps/cmburn/mce_check
Thu ... 2012: node001 - burn-control: starting test /cm/shared/apps/cmburn/kmon
| Thu ... 2012: | node001 - disktest: |     | starting, | threshold | =   | 30 MB/s |
| ------------- | ------------------- | --- | --------- | --------- | --- | ------- |
’
| Thu ... 2012: | node001 - mce_check: |        | checking | for MCE   | s every | minute |
| ------------- | -------------------- | ------ | -------- | --------- | ------- | ------ |
| Thu ... 2012: | node001 - kmon:      | kernel | log      | monitor   | started |        |
| Thu ... 2012: | node001 - disktest:  |        | detected | 1 drives: | sda     |        |
...
| Thu ... 2012: | node001 - disktest: |     | drive sda | wrote | 81920 | MB in 1278.13 |
| ------------- | ------------------- | --- | --------- | ----- | ----- | ------------- |
Thu ... 2012: node001 - disktest: speed for drive sda was 64 MB/s -> disk passed
Thu ... 2012: node001 - burn-control: test disktest has ended, test FAILED
Thu ... 2012: node001 - burn-control: all non-endless test are done, terminating endless tests
Thu ... 2012: node001 - burn-control: asking test /cm/shared/apps/cmburn/kmon/kmon to terminate
| Thu ... 2012: | node001 - kmon: | kernel | log | monitor | terminated |     |
| ------------- | --------------- | ------ | --- | ------- | ---------- | --- |
Thu ... 2012: node001 - burn-control: test kmon has ended, test passed
Thu ... 2012: node001 - burn-control: asking test /cm/shared/apps/cmburn/mce_check/mce_check\
to terminate
| Thu ... 2012: | node001 - mce_check: |     | terminating |               |     |         |
| ------------- | -------------------- | --- | ----------- | ------------- | --- | ------- |
| Thu ... 2012: | node001 - mce_check: |     | waiting     | for mce_check |     | to stop |
’
| Thu ... 2012: | node001 - mce_check: |     | no MCE     | s found |     |     |
| ------------- | -------------------- | --- | ---------- | ------- | --- | --- |
| Thu ... 2012: | node001 - mce_check: |     | terminated |         |     |     |
Thu ... 2012: node001 - burn-control: test mce_check has ended, test passed
| Thu ... 2012: | node001 - burn-control: |     | phase | 02-disks       | FAILED |     |
| ------------- | ----------------------- | --- | ----- | -------------- | ------ | --- |
| Thu ... 2012: | node001 - burn-control: |     | burn  | will terminate |        |     |
Theoutputoftheburn logcommandisactuallythemessagesfileintheburndirectory,forthenode
associated with a MAC-address directory <mac>. The burn directory is at /var/spool/burn/ and the
messagesfileisthuslocatedat:
/var/spool/burn/<mac>/messages
ThetestshavetheirlogfilesintheirowndirectoriesundertheMAC-addressdirectory, usingtheir
Forexample,thepre-installsectionhasaphasenamed01-hwinfo.
phasename. Theoutputlogsofthis
testarethenstoredunder:
/var/spool/burn/<mac>/01-hwinfo/
11.3.2 WritingATestScript
Thissectiondescribesasampletestscriptforusewithintheburnframework. Thescriptistypicallya
shellorPerlscript. ThesamplethatfollowsisaBashscript,whilethehplscriptisanexampleinPerl.
Section11.1describeshowtodeploythescript.
Non-endlessTests
Thefollowingexampletestscriptisnotaworkingtestscript,butcanbeusedasatemplateforanon-
endlesstest:
Example
#!/bin/bash
# We need to know our own test name, amongst other things for logging.
| ‘            | ‘   |     |     |     |     |     |
| ------------ | --- | --- | --- | --- | --- | --- |
| me= basename | $0  |     |     |     |     |     |

110 BurningNodes
# This first argument passed to a test script by the burn framework is a
# path to a spool directory. The directory is created by the framework.
# Inside the spool directory a sub-directory with the same name as the
# test is also created. This directory ($spooldir/$me) should be used
# for any output files etc. Note that the script should possibly remove
# any previous output files before starting.
spooldir=$1
# In case of success, the script should touch $passedfile before exiting.
passedfile=$spooldir/$me.passed
# In case of failure, the script should touch $failedfile before exiting.
# Note that the framework will create this file if a script exits without
# creating $passedfile. The file should contain a summary of the failure.
failedfile=$spooldir/$me.failed
# In case a test detects trouble but does not want the entire burn to be
# halted $warningfile _and_ $passedfile should be created. Any warnings
# should be written to this file.
warningfile=$spooldir/$me.warning
# Some short status info can be written to this file. For instance, the
# stresscpu test outputs something like 13/60 to this file to indicate
# time remaining.
# Keep the content on one line and as short as possible!
statusfile=$spooldir/$me.status
# A test script can be passed arguments from the burn configuration. It
# is recommended to supply default values and test if any values have
# been overridden from the config file. Set some defaults:
option1=40
option2=some_other_value
# Test if option1 and/or option2 was specified (note that $1 was to
# spooldir parameter):
if [ ! x$2 = "x" ]; then
option1=$2
fi
if [ ! x$3 = "x" ]; then
option2=$3
fi
# Some scripts may require some cleanup. For instance a test might fail
# and be
# restarted after hardware fixes.
rm -f $spooldir/$me/*.out &>/dev/null
# Send a message to the burn log file, syslog and the screen.
# Always prefix with $me!
blog "$me: starting, option1 = $option1 option2 = $option2"
# Run your test here:
run-my-test
if [ its_all_good ]; then
’
blog "$me: wOOt, it s all good! my-test passed."

11.3RunningABurnConfiguration 111
touch $passedfile
exit 0
| elif [ | was_a_problem | ];  | then |     |     |     |     |
| ------ | ------------- | --- | ---- | --- | --- | --- | --- |
’
blog "$me: WARNING, it did not make sense to run this test. You don t have special device X."
| echo | "some warning" | >>  | $warningfile |     | # note | the append! |     |
| ---- | -------------- | --- | ------------ | --- | ------ | ----------- | --- |
touch $passedfile
exit 0
else
’
| blog | "$me: Aiii,        | we re | all gonna     | die! | my-test | FAILED!" |     |
| ---- | ------------------ | ----- | ------------- | ---- | ------- | -------- | --- |
| echo | "Failure message." |       | > $failedfile |      |         |          |     |
exit 0
fi
EndlessTests
Thefollowingexampletestscriptisnotaworkingtest,butcanbeusedasatemplateforanendlesstest.
Example
#!/bin/bash
# We need to know our own test name, amongst other things for logging.
| ‘            | ‘   |     |     |     |     |     |     |
| ------------ | --- | --- | --- | --- | --- | --- | --- |
| me= basename | $0  |     |     |     |     |     |     |
# This first argument passed to a test script by the burn framework is a
# path to a spool directory. The directory is created by the framework.
# Inside the spool directory a sub-directory with the same name as the
| # test | is also created. |     | This directory |     | ($spooldir/$me) |     | should be used |
| ------ | ---------------- | --- | -------------- | --- | --------------- | --- | -------------- |
# for any output files etc. Note that the script should possibly remove
| # any previous | output | files | before | starting. |     |     |     |
| -------------- | ------ | ----- | ------ | --------- | --- | --- | --- |
spooldir=$1
# In case of success, the script should touch $passedfile before exiting.
passedfile=$spooldir/$me.passed
# In case of failure, the script should touch $failedfile before exiting.
# Note that the framework will create this file if a script exits without
# creating $passedfile. The file should contain a summary of the failure.
failedfile=$spooldir/$me.failed
# In case a test detects trouble but does not want the entire burn to be
# halted $warningfile _and_ $passedfile should be created. Any warnings
| # should | be written | to this | file. |     |     |     |     |
| -------- | ---------- | ------- | ----- | --- | --- | --- | --- |
warningfile=$spooldir/$me.warning
# Some short status info can be written to this file. For instance, the
# stresscpu test outputs something like 13/60 to this file to indicate
# time remaining.
| # Keep | the content | on one | line | and as short | as  | possible! |     |
| ------ | ----------- | ------ | ---- | ------------ | --- | --------- | --- |
statusfile=$spooldir/$me.status
# Since this in an endless test the framework needs a way of stopping it
# once all non-endless test in the same phase are done. It does this by
| # calling | the script         | once | more    | and passing | a "-terminate" |     | argument. |
| --------- | ------------------ | ---- | ------- | ----------- | -------------- | --- | --------- |
| if [ "$2" | == "-terminate"    |      | ]; then |             |                |     |           |
| blog      | "$me: terminating" |      |         |             |                |     |           |

112 BurningNodes
| # remove | the lock | file | the | main loop | is checking | for |     |
| -------- | -------- | ---- | --- | --------- | ----------- | --- | --- |
rm $spooldir/$me/running
| blog "$me: | waiting   | for  | $me               | to stop" |     |     |     |
| ---------- | --------- | ---- | ----------------- | -------- | --- | --- | --- |
| # wait     | for the   | main | loop to           | die      |     |     |     |
|            |           | ‘    |                   |          | ‘   |     |     |
| while [    | -d /proc/ | cat  | $spooldir/$me/pid |          | ]   |     |     |
do
sleep 1
done
| blog "$me: | terminated" |     |     |     |     |     |     |
| ---------- | ----------- | --- | --- | --- | --- | --- | --- |
else
| blog "$me: | starting |     | test, | checking every | minute" |     |     |
| ---------- | -------- | --- | ----- | -------------- | ------- | --- | --- |
# Some scripts may require some cleanup. For instance a test might fail
| # and be                  | restarted | after | hardware | fixes.      |             |         |       |
| ------------------------- | --------- | ----- | -------- | ----------- | ----------- | ------- | ----- |
| rm -f $spooldir/$me/*.out |           |       |          | &>/dev/null |             |         |       |
| # create                  | internal  | lock  | file,    | the script  | will remove | this if | it is |
| # requested               | to        | end   |          |             |             |         |       |
touch $spooldir/$me/running
| # save  | our process                | id  |     |     |     |     |     |
| ------- | -------------------------- | --- | --- | --- | --- | --- | --- |
| echo $$ | > "$spooldir/$me/pid"      |     |     |     |     |     |     |
| while [ | -e "$spooldir/$me/running" |     |     | ]   |     |     |     |
do
run-some-check
| if [ | was_a_problem |          | ]; then   |              |            |             |     |
| ---- | ------------- | -------- | --------- | ------------ | ---------- | ----------- | --- |
| blog | "$me:         | WARNING, | something | unexpected   | happened." |             |     |
| echo | "some         | warning" | >>        | $warningfile | # note     | the append! |     |
| elif | [ failure     | ];       | then      |              |            |             |     |
’
| blog | "$me:    | Aiii,     | we re | all gonna     | die! my-test | FAILED!" |     |
| ---- | -------- | --------- | ----- | ------------- | ------------ | -------- | --- |
| echo | "Failure | message." |       | > $failedfile |              |          |     |
fi
sleep 60
done
| # This | part is          | only    | reached   | when the | test is terminating. |     |     |
| ------ | ---------------- | ------- | --------- | -------- | -------------------- | --- | --- |
| if [ ! | -e "$failedfile" |         | ];        | then     |                      |     |     |
| blog   | "$me: no         | problem | detected" |          |                      |     |     |
touch $passedfile
else
| blog | "$me: test | ended | with | a failure" |     |     |     |
| ---- | ---------- | ----- | ---- | ---------- | --- | --- | --- |
fi
fi
11.3.3 BurnFailures
Whenevertheburnprocessfails,theoutputoftheburn logcommandshowsthephasethathasfailed
andthattheburnterminates.
Example

11.4RelocatingTheBurnLogs 113
| Thu ... | 2012: node001 | - burn-control: | phase 02-disks      | FAILED |     |     |
| ------- | ------------- | --------------- | ------------------- | ------ | --- | --- |
| Thu ... | 2012: node001 | - burn-control: | burn will terminate |        |     |     |
Here,burn-control,whichistheparentofthedisktestingprocess,keepstrackoftheteststhatpass
andfail. Onfailureofatest,burn-controlterminatesalltests.
Thenodethathasfailedthenrequiresinterventionfromtheadministratorinordertochangestate.
Thenodedoesnotrestartbydefault. Theadministratorshouldbeawarethatthestatereportedbythe
nodetoCMDaemonremainsburningatthispoint,eventhoughitisnotactuallydoinganything.
Tochangethestate,theburnmustbestoppedwiththeburn stopcommandincmsh. Ifthenodeis
restartedwithoutexplicitlystoppingtheburn,thenitsimplyretriesthephaseatwhichitfailed.
Undertheburnlogdirectory,thelogoftheparticulartestthatfailedforaparticularnodecansome-
timessuggestareasonforthefailure. Forretries,oldlogsarenotoverwritten,butmovedtoadirectory
withthesamename,andanumberappendedindicatingthetrynumber. Thus:
Example
Firsttry,andfailingat02-diskstests:
cd /var/spool/burn/48:5b:39:19:ff:b3
ls -ld 02-disks*/
| drwxr-xr-x | 6 root root | 4096 Jan | 10 16:26 02-disks |     |     |     |
| ---------- | ----------- | -------- | ----------------- | --- | --- | --- |
2ndtry,afterfailingagain:
ls -ld 02-disks*/
| drwxr-xr-x | 6 root root | 4096 Jan | 10 16:49 02-disks   |     |     |     |
| ---------- | ----------- | -------- | ------------------- | --- | --- | --- |
| drwxr-xr-x | 6 root root | 4096 Jan | 10 16:26 02-disks.1 |     |     |     |
3rdtry,afterfailingagain:
ls -ld 02-disks*/
| drwxr-xr-x | 6 root root | 4096 Jan | 10 16:59 02-disks   |     |     |     |
| ---------- | ----------- | -------- | ------------------- | --- | --- | --- |
| drwxr-xr-x | 6 root root | 4096 Jan | 10 16:49 02-disks.1 |     |     |     |
| drwxr-xr-x | 6 root root | 4096 Jan | 10 16:26 02-disks.2 |     |     |     |
| 11.4       | Relocating  | The Burn | Logs                |     |     |     |
Aburnruncanappendsubstantialamountsoflogdatatothedefaultburnspoolat/var/spool/burn.
Toavoidfillinguptheheadnodewithsuchlogs,theycanbeappendedelsewhere.
11.4.1 ConfiguringTheRelocation
The3-partprocedurethatcanbefollowedis:
1. The BurnSpoolDir setting can be set in the CMDaemon configuration file on the head node, at
| /cm/local/apps/cmd/etc/cmd.conf. |     |     | BurnSpoolDir |               |          |               |
| -------------------------------- | --- | --- | ------------ | ------------- | -------- | ------------- |
|                                  |     |     | The          | setting tells | CMDaemon | where to look |
forburndatawhentheburnstatusisrequestedthroughcmsh.
|     | • BurnSpoolDir="/var/spool/burn" |     |     |     |     |     |
| --- | -------------------------------- | --- | --- | --- | --- | --- |
CMDaemonshouldberestartedaftertheconfigurationhasbeenset. Thiscanbedonewith:
| service | cmd restart |     |     |     |     |     |
| ------- | ----------- | --- | --- | --- | --- | --- |
2. The burnSpoolHost setting, which matches the host, and burnSpoolPath setting,
which matches the location, can be changed in the node-installer configuration file
on the head node, at /cm/node-installer/scripts/node-installer.conf (for multi-
arch/multidistro configurations the path takes the form: /cm/node-installer-<distribution>-
<architecture>/scripts/node-installer.conf). Thesehavethefollowingvaluesbydefault:

114 BurningNodes
• burnSpoolHost = master
• burnSpoolPath = /var/spool/burn
ThesevaluesdefinetheNFS-mountedspooldirectory.
The burnSpoolHost value should be set to the new DNS host name, or to an IP address. The
burnSpoolPathvalueshouldbesettothenewpathforthedata.
3. Part 3 of the procedure adds a new location to export the burn log. This is only relevant if the
spool directory is being relocated within the head node. If the spool is on an external fileserver,
theexistingburnlogexportmayaswellberemoved.
Thenewlocationcanbeaddedtotheheadnodeasapathvalue,fromawritablefilesystemexport
name. The writable filesystem export name can most easily be added using Base View, via the
navigationpath:
Devices > All Devices > Head Node > Settings > Filesystem exports > + Add
Adding a new name like this is recommended, instead of just modifying the path value in an
existingFilesystem exportsname. Thisisbecausechangingthingsbackiftheconfigurationis
doneincorrectlyistheneasy. Bydefault,theexistingFilesystem exportsfortheburndirectory
hasthename:
• /var/spool/burn@internalnet
andhasapathassociatedwithitwithadefaultvalueof:
• /var/spool/burn
WhenthenewnameissetinFilesystem exports,theassociatedpathvaluecanbesetinagree-
mentwiththevaluessetearlierinparts1and2.
IfusingcmshinsteadofBaseView,thenthechangecanbecarriedoutfromwithinthefsexports
submode. Section3.13.1oftheAdministratorManualgivesmoredetailonsimilarexamplesofhow
toaddsuchfilesystemexports.
11.4.2 TestingTheRelocation
To test the changes, it is wise to first try a single node with a short burn configuration. This allows
theadministratortocheckthatinstallandpost-installtestscanaccessthespooldirectories. Otherwise
thereisariskofwaitinghoursforthepre-installteststocomplete, onlytohavetheburnabortonthe
post-installtests. Thefollowingshortburnconfigurationcanbeused:
Example
<burnconfig>
<pre-install>
<phase name="01-hwinfo">
<test name="hwinfo"/>
<test name="sleep" args="10"/>
</phase>
</pre-install>
<post-install>
<phase name="02-mprime">
<test name="mprime" args="2"/>
<test name="mce_check" endless="1"/>
<test name="kmon" endless="1"/>
</phase>
</post-install>
</burnconfig>

11.4RelocatingTheBurnLogs 115
Toburnasinglenodewiththisconfiguration, thefollowingcouldberunfromthedevicemodeof
cmsh:
Example
[basecm11->device]% burn start --config default-destructive --edit -n node001
Thismakesaneditorpopupcontainingthedefaultburnconfiguration. Thecontentcanbereplaced
with the short burn configuration. Saving and quitting the editor causes the node to power cycle and
startitsburn.
Theexampleburnconfigurationtypicallycompletesinlessthan10minutesorso,dependingmostly
onhowfastthenodecanbeprovisioned. Itrunsthemprimetestforabouttwominutes.

12
Installing And Configuring
SELinux
12.1 Introduction
Security-EnhancedLinux(SELinux)canbeenabledonselectednodes. IfSELinuxisenabledonastan-
dardLinuxoperatingsystem,thenitistypicallyinitializedinthekernelwhenbootingfromaharddrive.
However, in the case of nodes provisioned by NVIDIA Base Command Manager, using PXE boot, the
SELinuxinitializationoccursattheveryendofthenode-installerphase.
SELinux is disabled by default because its security policies are typically customized to the needs
of the organization using it. The administrator must therefore decide on appropriate access control
securitypolicies. Whencreatingsuchcustompolicies,specialcareshouldbetakenthatthecmdprocess
isexecutedin,ideally,anunconfinedcontext.
BeforeenablingSELinuxonacluster,theadministratorisadvisedtofirstcheckthattheLinuxdistri-
butionusedoffersenterprisesupportforSELinux-enabledsystems.ThisisbecausesupportforSELinux
shouldbeprovidedbythedistributionincaseofissues.
Enabling SELinux is only advised for BCM if the internal security policies of the organization ab-
solutely require it. This is because it requires custom changes from the administrator. If something is
not working right, then the effect of these custom changes on the installation must also be taken into
consideration,whichcansometimesbedifficult.
SELinux is partially managed by BCM and can run on the head and regular nodes. The SELinux
settingsmanagedbyCMDaemon(usingcmshorBaseView)shouldnotbemanagedbydirectlydealing
withthenodeoutsideofCMDaemonmanagement,asthatcanleadtoaninconsistentknowledgeofthe
SELinuxsettingsbyCMDaemon.
WhenfirstconfiguringSELinuxtorunwithBCMonregularnodes,thenodesshouldbeconfigured
with permissive mode to ensure that the nodes work with applications. Troubleshooting permissive
mode so that enforcing mode can be enabled is outside the scope of BCM support, unless the issue is
demonstrablyaBCM-relatedissue.
12.2 Enabling SELinux On RHEL8, Rocky 9
12.2.1 SettingSELinuxParameters
Theselinuxsettingsmodeisavailableatnode,category,orpartitionlevel.
Example
[root@basecm11 ~]# cmsh
[basecm11]% device use node001
[basecm11->device[node001]]% selinuxsettings
[basecm11->device[node001]->selinuxsettings]% show
Parameter Value

118 InstallingAndConfiguringSELinux
-------------------------------- ------------------------------------------------
Initialize yes
Revision
| Reboot after | context          | restore no     |     |
| ------------ | ---------------- | -------------- | --- |
| Allow NFS    | home directories | yes            |     |
| Context      | action auto      | install always |     |
| Context      | action full      | install always |     |
| Context      | action nosync    | install always |     |
Mode permissive
Policy targeted
| Key value | settings | <submode> |     |
| --------- | -------- | --------- | --- |
TheModecanbesettopermissive,enforcingordisabled. WhenstartingtheuseofSELinuxand
establishingpolicies,itshouldbesettopermissivetobeginwith,sothattroubleshootingissuestodo
withrunningapplicationswithenforcingmodecanbeexamined.
The default SELinux configuration parameters are in /cm/node-installer/scripts/
node-installer.conf, and that file remains unchanged by cmsh settings changes. The values of
SELinux configuration parameters used from that file are however overridden by the corresponding
cmshsettings.
For multiarch/multidistro configurations the node-installer path in the preceding session takes
theform: /cm/node-installer-<distribution>-<architecture>/scripts/node-installer.conf. Theval-
uesfor<distribution>and<architecture>cantakethevaluesoutlinedon(page550oftheAdministrator
Manual).
12.2.2 SettingUpOnTheHeadNode
The followingprocedure can berun on bothhead nodesto configure SELinuxon Rocky 9, so that the
SELinuxenforcingmodeisenabled:
| [root@basecm11                                    | ~]#    | cmsh                |                    |
| ------------------------------------------------- | ------ | ------------------- | ------------------ |
| [basecm11]%                                       | device | use master          |                    |
| [basecm11->device[basecm11]]%                     |        | selinuxsettings     |                    |
| [basecm11->device[basecm11]->selinuxsettings]%    |        |                     | set mode enforcing |
| [basecm11->device*[basecm11*]->selinuxsettings*]% |        |                     | commit             |
| [basecm11->device[basecm11]->selinuxsettings]%    |        |                     | quit               |
| [root@basecm11                                    | ~]#    | touch /.autorelabel |                    |
| [root@basecm11                                    | ~]#    | reboot              |                    |
...
| [root@basecm11 | ~]# | getenforce |     |
| -------------- | --- | ---------- | --- |
Enforcing
12.2.3 SettingUpOnTheRegularNodes
Asimilarpatterncanberepeatedontheregularnodes.
ConfiguringTheSELinuxSettings
TheSELinuxsettingscanbeconfiguredatpartition,category,ornodelevel.
Nodes that are to use SELinux can be placed in a category, secategory. The secategory category
canbecreatedbycloningitfromthedefaultcategorythatcomeswithanewly-installedcluster:
Example
| [root@basecm11        | ~]#      | cmsh           |       |
| --------------------- | -------- | -------------- | ----- |
| [basecm11]%           | category |                |       |
| [basecm11->category]% |          | list           |       |
| Name (key)            |          | Software image | Nodes |

12.2EnablingSELinuxOnRHEL8,Rocky9 119
| ------------------------ |     | ------------------------ |             | -------- |     |     |
| ------------------------ | --- | ------------------------ | ----------- | -------- | --- | --- |
| default                  |     | default-image            |             | 4        |     |     |
| [basecm11->category]%    |     | clone default            | secategory; | commit   |     |     |
TheSELinuxsettingscanthenbeconfiguredforthenewly-clonedcategory.
Example
| [basecm11->category]%                              |     | use secategory; | selinuxsettings |                  |     |     |
| -------------------------------------------------- | --- | --------------- | --------------- | ---------------- | --- | --- |
| [basecm11->category[secategory]->selinuxsettings]% |     |                 |                 | keyvaluesettings |     |     |
[basecm11->category*[secategory*]->selinuxsettings*->keyvaluesettings*]% set domain_can_mmap_files 1
[basecm11->category*[secategory*]->selinuxsettings*->keyvaluesettings*]% exit
[basecm11->category*[secategory*]->selinuxsettings*]% set mode<tab><tab>
| disabled | enforcing | permissive |     |     |     |     |
| -------- | --------- | ---------- | --- | --- | --- | --- |
[basecm11->category*[secategory*]->selinuxsettings*]% set mode permissive #for now, to debug apps
| [basecm11->category*[secategory*]->selinuxsettings*]% |     |     |     |     | commit |     |
| ----------------------------------------------------- | --- | --- | --- | --- | ------ | --- |
The domain_can_mmap_files boolean setting is needed to allow SELinux policies to revalidate some
kindsoffileaccessinmemory.
ConfiguringTheSELinuxImageToBeUsed
TheproblemwithSELinuxfilecontextsonthenodewhenagainprovisioninganimage: Iftheimage
thatisusedtoprovisionthenodestillhastheoldfileattributes,andiftheprovisioningmodeisFULL
orAUTO(section5.4.4oftheAdministratorManual),thenimagesyncduringnode-installerprovisioning
resultsinrevertingtheSELinuxfilecontextsthathavebeensetupontherunningnodebacktotheold
state.
Thus, for FULL or AUTO provisioning modes, if default-image has no SELinux file security con-
texts,thentheSELinuxfilesecuritycontextsvanishafterthenodecomesbackupafterareboot.
Creating a new image and using setfiles to set up SELinux file contexts on the new image: One
goodwaytohaveanodecomeupwithSELinuxfilecontexts,istosetuptheimagethatisprovisioned
sothattheimagehasthecontextsalready.
Thiscanbeconfiguredbyfirstcloningtheimage,with:
Example
| [basecm11->category[secategory]->selinuxsettings]% |     |      |     | softwareimage |         |       |
| -------------------------------------------------- | --- | ---- | --- | ------------- | ------- | ----- |
| [basecm11->softwareimage]%                         |     | list |     |               |         |       |
| Name (key)                                         |     | Path |     | Kernel        | version | Nodes |
-------------------- ----------------------------- ----------------------------- --------
default-image /cm/images/default-image 5.14.0-284.11.1.el9_2.x86_64 5
| [basecm11->softwareimage]% |     | clone | default-image | selinux-image; | commit |     |
| -------------------------- | --- | ----- | ------------- | -------------- | ------ | --- |
...
...[notice] basecm11: Initial ramdisk for image selinux-image was generated successfully
Then,afterselinux-imagehasbeengenerated,thecontextscanbesetupinthenewimagewiththe
SELinuxsetfilescommand,usingthe-roptiontosettherootpath:
Example
| [basecm11->softwareimage]% |     | quit                                 |     |     |     |     |
| -------------------------- | --- | ------------------------------------ | --- | --- | --- | --- |
| [root@basecm11             | ~]# | setfiles -r /cm/images/selinux-image |     |     | \   |     |
/etc/selinux/targeted/contexts/files/file_contexts /cm/images/selinux-image/
| [root@basecm11 | ~]# | setfiles -r /cm/images/selinux-image |     |     | \   |     |
| -------------- | --- | ------------------------------------ | --- | --- | --- | --- |
/etc/selinux/targeted/contexts/files/file_contexts.local /cm/images/selinux-image/
Iftheimageisupdatedinthefuturewithnewpackages,ornewfiles,thenthesetfilescommands
intheprecedingexamplemustberunagaintosetthefilecontexts.

120 InstallingAndConfiguringSELinux
Organizing the nodes and setting them up with the newly-created SELinux image: Nodes in the
categorycanbelistedwith:
| [basecm11->category[secategory]]% | listnodes |     |
| --------------------------------- | --------- | --- |
...liststhenodesinthatcategory...
Nodes can be placed in the category from device mode. For example, node001, node002, and
node003canbeconfiguredwith:
| [basecm11->category[secategory]]% | device |     |
| --------------------------------- | ------ | --- |
[basecm11->device]% foreach -n node001..node003 (set category secategory)
IfthenodesinthecategorysecategoryaretorunfilesystemswithSELinuxfilecontexts,thenthe
imagegeneratedforthisearlieron,selinux-image,canbecommittedtothatcategorywith:
Example
| [basecm11->category[secategory]]%   | set softwareimage | selinux-image |
| ----------------------------------- | ----------------- | ------------- |
| [basecm11->category*[secategory*]]% | commit            |               |
BootingTheImageForSELinuxOnTheRegularNode
Thecategorycanthenberebootedtocheckthatallisworkingcorrectly.
Example
| [basecm11->category[secategory]]% | device reboot | -c secategory |
| --------------------------------- | ------------- | ------------- |
Reboot in progress for: node001..node003
...
...reboottakesplace...
| [basecm11->category[secategory]]% | !ssh node001 | "getenforce" |
| --------------------------------- | ------------ | ------------ |
Permissive
| [basecm11->category[secategory]]% | !ssh node001    | "ls -Z" |
| --------------------------------- | --------------- | ------- |
| system_u:object_r:admin_home_t:s0 | original-ks.cfg |         |
| system_u:object_r:admin_home_t:s0 | rpmbuild        |         |

A
| Other | Licenses, | Subscriptions, |
| ----- | --------- | -------------- |
Or Support Vendors
NVIDIABaseCommandManagercomeswithenoughsoftwaretoallowittoworkwithnoadditional
commercialrequirementsotherthanitsown. However,BCMintegrateswithsomeotherproductsthat
have their own separate commercial requirements. The following table lists commercial software that
requiresaseparatelicense,subscription,orsupportvendor,andanassociatedURLwheremoreinfor-
mationcanbefound.
| Software | URL |     |
| -------- | --- | --- |
Workloadmanagers
| PBSProfessional | http://www.altair.com            |     |
| --------------- | -------------------------------- | --- |
| MOAB            | http://www.adaptivecomputing.com |     |
LSF http://www.ibm.com/systems/platformcomputing/products/lsf/
| GE  | http://www.altair.com |     |
| --- | --------------------- | --- |
Distributions
| Suse   | http://www.suse.com   |     |
| ------ | --------------------- | --- |
| RedHat | http://www.redhat.com |     |
Compilers
| Intel | https://software.intel.com/en-us/intel-sdp-home |     |
| ----- | ----------------------------------------------- | --- |
Miscellaneous
| AmazonAWS | http://aws.amazon.com |     |
| --------- | --------------------- | --- |

B
Hardware Recommendations
Thehardwaresuggestionsinsection3.1areforaminimalcluster,andareinadequateforlargerclusters.
Forlargerclusters,hardwaresuggestionsandexamplesaregiveninthissection.
ThememoryuseddependssignificantlyonCMDaemon,whichisthemainNVIDIABaseCommand
Managerservicecomponent,andonthenumberofprocessesrunningontheheadnodeorregularnode.
Thenumberofprocessesmostlydependsonthenumberofmetricsandhealthchecksthatarerun.
Hard drive storage mostly depends on the number of metrics and health checks that are managed
byCMDaemon.
B.1 Heuristics For Requirements
Normalsystemprocessesrunontheheadandregularnodeiftheclustermanagerisnotrunning,and
takeuptheirownRAManddrivespace.
B.1.1 HeuristicsForRequirementsForARegularNode
Acalculationoftypicalregularnoderequirementscanbemadeasfollows:
RegularNodeDiskSize
For disked nodes, a disk size of around 25 GB is the minimum needed. 256GB should always be fine
at the time of writing of this section (October 2023). The disk size should be large enough to hold the
entireregularnodeimagethattheheadnodesuppliestoit,whichtypicallyisaround6GB,alongwith
swap,logfilesandotherlocaloverheadforthejobsthatwillrunontheregularnode.
RegularNodeMemorySize
ThetotalRAMrequiredisroughlythesumof:
RAMusedfornon−BCMsystemprocesses+50MB+(numberofnodes×10kB).
B.1.2 HeuristicsForRequirementsForAHeadNode
Acalculationoftypicalheadnoderequirementscanbemadeasfollows:
HeadNodeDiskSize
Thedisksizerequiredisroughlythesumof:
spaceneededbyoperatingsystemwithoutclustermanager + 5GBperregularnodeimage +
(100kB×numberofmetricsandhealthchecks×numberofdevices)
A device means any item seen as a device by CMDaemon. A list of devices can be seen by cmsh
under its device mode. Examples of devices are: regular nodes, cloud nodes, switches, head nodes,
GPUunits,andPDUs.

124 HardwareRecommendations
HeadNodeMemorySize
ThetotalRAMrequiredisroughlythesumof:
RAMusedfornormalsystemprocess+100MB+(numberofnodes×1.8MB)
This assumes less than 100 metrics and health checks are being measured, which is a default for
systemsthatarejustheadnodesandregularnodes.Beyondthefirst100metricsandhealthchecks,each
further100extratakeabout1MBextraperdevice.
B.2 Observed Head Node Resources Use, And Suggested Specification
B.2.1 ObservedHeadNodeExampleCMDaemonAndMySQLResourcesUse
CMDaemon and MySQL have the following approximate default resource usage on the head node as
thenumberofnodesincreases:
Numberofnodes CMDaemon+MySQLRAM/GB CMDaemonRAM/GB DiskUse/GB
1000 16 2 10
2000 32 4 20
5000 64 10 50
B.2.2 SuggestedHeadNodeSpecificationForClustersBeyond1000Nodes
Forclusterswithmorethan1000nodes,aheadnodeisrecommendedwithatleastthefollowingspeci-
fications:
• 24cores
• 128GBRAM
• 512GBSSD
TheextraRAMisusefulforcachingthefilesystem,soscrimpingonitmakeslittlesense.
Handyforspeedyretrievalsistoplacethemonitoringdatafiles,whicharebydefaultlocatedunder
/var/spool/cmd/monitoring/,onanSSD.
A dedicated /var or /var/lib/mysql partition for clusters with greater than 2500 nodes is also a
goodidea.

C
BCM And NVIDIA AI
Enterprise
Some features of BCM are certified for NVIDIA AI Enterprise (https://docs.nvidia.com/
ai-enterprise/index.html).
C.1 Certified Features Of BCM For NVIDIA AI Enterprise
TheBCMFeatureMatrixat:
https://service.bcm.nvidia.com/feature-matrix/
hasacompletelistofthefeaturesofBCMthatarecertifiedforNVIDIAAIEnterprise.
C.2 NVIDIA AI Enterprise Compatible Servers
BCMmustbedeployedonNVIDIAAIEnterprisecompatibleservers.
TheNVIDIAQualifiedSystemCatalogat:
https://www.nvidia.com/en-us/data-center/data-center-gpus/qualified-system-catalog/
displaysacompletelistofNVIDIAAIEnterprisecompatibleserversiftheNVAIE Compatibleoption
isselected.
C.3 NVIDIA Software Versions Supported
NVIDIAAIEnterprisesupportsspecificversionsofNVIDIAsoftware,including
• NVIDIAdrivers
• NVIDIAcontainers
• theNVIDIAContainerToolkit
• theNVIDIAGPUOperator
• theNVIDIANetworkOperator
TheNVIDIAAIEnterpriseCatalogOnNGCat:
https://catalog.ngc.nvidia.com/enterprise
liststhespecificversionsofsoftwareincludedinarelease.

126 BCMAndNVIDIAAIEnterprise
| C.4 NVIDIA | AI Enterprise | Product Support | Matrix |
| ---------- | ------------- | --------------- | ------ |
TheNVIDIAAIEnterpriseProductSupportMatrixat:
https://docs.nvidia.com/ai-enterprise/latest/product-support-matrix/index.html
liststheplatformsthataresupported.

D
NVIDIA BCM Scope Of Support
D.1 Included In BCM Support
NVIDIA Base Command Manager (BCM) technical support has a standard scope of coverage that in-
cludesthefollowing:
D.1.1 SupportForClusterInstallation
TheBCMsupportteamwillhelpinstallBCMonasupportedLinuxbasedistribution,usinganyofthe
documentedBCMfeatures.
If the add-on installation method is used (as opposed to the bare-metal installation method), then
installationontopofadefaultminimalinstallationofthebaseLinuxdistributionissupported.Adefault
minimalinstallationoftheLinuxbasedistributionmeansselectingaminimalsetofpackagesduringthe
installationandleavingallsettingsattheirdefaults.
D.1.2 SupportForClusterConfiguration
The BCM support team can help create configurations to meet the specific needs of a customer using
anyofthedocumentedBCMfeatures.
IfSecurity-EnhancedLinux(SELinux)isenabledontheheadnodeorcomputenodesandaproblem
arises, then a customer may be asked to demonstrate that the problem also exists when SELinux is
disabled,inordertoconfirmthattheproblemisnotcausedbyanSELinuxpolicyconfiguration.
D.1.3 SupportForIntegrationOfClusterInSiteInfrastructure
Siteinfrastructuresvarygreatly,andsosupportisnotprovidedforthethird-partyhardwareandsoft-
warethatmaybeinvolved. Nevertheless,theBCMsupportteamwilldoitsbesttoprovidesupporton
mattersrelatedtoclusterintegrationwithinasite’sinfrastructure.
InformationonhowtoaccomplishmanyintegrationtasksisprovidedintheBCMproductmanuals
and knowledge base, and is often all that is needed to get the job done. If not, then the BCM support
team may be able to help. The BCM support team will ask that the customer demonstrate how to
accomplish the aspect of integration on an ordinary machine running the same Linux distribution as
the cluster. Once the BCM support team has that information, it can provide instructions on how to
accomplishthesametaskusingBCM.
D.1.4 SupportForIntegrationWithMicrosoftActiveDirectory
NVIDIAprovidesdocumentationthatdescribeshowtointegratetheBCMclusterwithActiveDirectory;
however,thatintegrationrequireshelpfromtheWindowsServeradministrators. Itistheresponsibility
oftheBCMadministratortocommunicatewiththeWindowsServeradministratorstogettherequired
informationforthechosenintegrationmethod.
DebuggingActiveDirectoryintegrationissuesisbeyondthescopeofstandardsupport.

128 NVIDIABCMScopeOfSupport
D.1.5 SupportForFirst-PartyHardwareOnly
The BCM support team does not provide support for third-party hardware issues. When it is unclear
whether an issue is due to hardware or software problems, the BCM support team will work with a
customertodeterminethesourceoftheproblem.
D.1.6 SupportForSoftwareUpgrades
Supportedcustomersreceiveaccesstoallnewsoftwarereleases, andtheBCMsupportteammanages
anyissuesthatariseasaresultofanupgrade.
To identify versions of its software, BCM uses pairs of numbers (e.g., 8.0 or 9.2). The first number
denotesthemajorversionofthesoftwareandthesecondnumberdenotestheminorversion.
Anupgradewithinthemajorversion(e.g., from9.1to9.2)iscalledaminorupgrade. Anupgrade
fromonemajorversiontothenext(e.g.,from8.2to9.0)iscalledamajorupgrade.
Minorupgradesandrecentmajorupgradescanbedoneinplace.TheBCMsupportteamwillenable
smoothtransitionsduringsoftwareupgrades.
D.2 Excluded From BCM Support
SupportcoverageforBCMexcludesthefollowing:
D.2.1 HelpWithThird-PartySoftware
Third-partysoftwareisallsoftwarenotdevelopedbyNVIDIA,eventhoughitmaybepackagedorinte-
gratedwithBCM.Examplesinclude,butmaynotbelimitedto,theLinuxkernel,allsoftwarebelonging
totheLinuxbasedistribution(e.g.,RedHat),OpenMPI,ScaleMP,andworkloadmanagementsystems
suchasSlurm,SGE,LSF,Torque,PBSPro,andUGE.
AnexceptionwillbemadeifacustomerdemonstratesthatNVIDIApackagedanapplicationincor-
rectly,orifthecustomerdemonstratesthattheintegrationinthestockuserenvironmentisincorrect.
D.2.2 HelpWithUserApplications
No support can be provided on issues related to compiling or running user applications, i.e., applica-
tionsthatarenotpackagedaspartofBCMandwhichareinstalledontoaclusterbyacustomerorother
individual.
If a customer suspects the issue relates to an NVIDIA product, then the problem must be demon-
stratedusingasmallapplicationthatwillallowNVIDIAengineerstoreproducetheproblem.
D.2.3 HelpWithWorkloadManagement
Nosupportwillbeprovidedonissuesrelatingtotheworkloadmanagementsystem.Theonlyexception
isduringtheinitialinstallationandconfigurationandincaseswhereacustomerdemonstratesthatan
issueiscausedbyincorrectintegrationbetweenBCMandtheworkloadmanager.
D.2.4 HelpWithPerformanceIssues
Nosupportwillbeprovidedtotraceperformanceissuesinthecluster. Theonlyexceptionsareperfor-
manceissuesrelatedtosoftwarecomponentsdevelopedbyNVIDIA.
D.2.5 Root-CauseAnalysis
TheNVIDIAsupportengineerswilldotheirbesttodeterminethecauseofafailure,butcannotguaran-
teethatallissuescanbetraceddowntoarootcause.
D.2.6 PhoneSupport
PhonesupportisnotprovidedbytheBCMsupportteam. Thisisbecausesupportviaawrittenticket
system is generally more efficient, as it usually allows better tracking, more precision in conveying

D.3SupportOutsideOfTheStandardScope—GettingProfessionalServices 129
meaning,easierinformationgathering,andamoreoptimalsavingofinformationforlaterinternalref-
erenceandsearchqueries.
D.3 Support Outside Of The Standard Scope—Getting Professional Services
Supportforitemsoutsideofthestandardscopeareconsideredprofessionalservices.
TheBCMsupportteamnormallydifferentiatesbetween
• regularsupport(customerhasaquestionorproblemthatrequiresananswerorresolution),and
• professional services (customer asks for the team to do something or asks the team to provide
someservice).
Professional services outside of the standard scope of support can be purchased via the NVIDIA
EnterpriseServicespageat:
https://www.nvidia.com/en-us/support/enterprise/services/