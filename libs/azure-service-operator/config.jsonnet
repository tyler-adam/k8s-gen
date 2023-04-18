local config = import 'jsonnet/config.jsonnet';

local versions = [
  {output: '2.0.0', version: '2.0.0'},
];

config.new(
  name='azure-service-operator',
  specs=[
    {
      local url = 'https://github.com/Azure/azure-service-operator/releases/download/v%s' % v.version,
      output: v.output,
      prefix: '^com\\.azure\\..*',
      crds: [
        url + '/azureserviceoperator_customresourcedefinitions_v%s.yaml' % v.version,
      ],
      localName: 'azure-service-operator',
    }
    for v in versions
  ]
)