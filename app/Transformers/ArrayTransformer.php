<?php

namespace App\Transformers;

class ArrayTransformer
{
    private array $array;

    public function __construct(array $array)
    {
        $this->array = $array;
    }

    /**
     * Make array flat
     *
     * @return array
     */
    final public function flatten(): array
    {
        $return = [];
        array_walk_recursive($this->array, function ($a) use (&$return) {
            $return[] = $a;
        });

        return $return;
    }
}
