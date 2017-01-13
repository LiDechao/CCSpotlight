# CCSpotlight
A simple way to use Spotlight.

## Usage

使用`CCSpotlightModel`模型类或是遵循`CCSpotlightModelProtocol`协议的自定义模型。

使用 `cc_saveToSpotlight` 来增添或是修改数据。 这取决于当前item的id是否曾经添加过。

删除的情形，分为按照 `id`、`domain`以及全部的方式，具体情形看使用情况了。
