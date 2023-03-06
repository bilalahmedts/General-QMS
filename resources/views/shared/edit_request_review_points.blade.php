@php $points = 0; @endphp
@if (count($categories) > 0)
    @foreach ($categories as $key => $category)
        @php
            $column_name = str_replace(' ', '_', strtolower($key));
        @endphp
        <div class="category">
            <div class="title">
                <h4>{{ $key }}
                </h4>
            </div>

            @if (count($category) > 0)
                <div class="data-points table-responsive">
                    <table class="table table-hover">
                        @foreach ($category as $point)
                            @php $points++; @endphp
                            <tr>
                                <td width="25%">{{ $point->datapoint->name ?? '' }}</td>
                                <td>{{ $point->datapoint->question ?? '' }}</td>
                                <td class="radios">
                                    <label class="radio-inline qrating"><input type="radio" class="radio" value="1" name="answers-{{ $point->id }}" @if($point->answer >= 1 && $point->answer != 6) checked @else disabled @endif>Yes</label>
                                    <label class="radio-inline qrating"><input type="radio" class="radio" value="0" name="answers-{{ $point->id }}" @if($point->answer == 0) checked @else disabled @endif>No</label>
                                    <label class="radio-inline qrating"><input type="radio" class="radio" value="6" name="answers-{{ $point->id }}" @if($point->answer == 6) checked @else disabled @endif>N/A</label>
                                </td>
                            </tr>
                        @endforeach
                    </table>
                </div>

            @else
                <h5 class="text-center">No data points found!</h5>
            @endif

        </div>

    @endforeach
@else
    <h4 class="text-center">No records found</h4>
@endif
